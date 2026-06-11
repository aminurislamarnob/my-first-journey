# Little Letters — Flutter Toddler Learning App: Implementation Plan

## Context

Build "Little Letters" (per `/Users/aiarnob/Downloads/little-letters-one-pager.html`): a trilingual learning app for kids ages 3–8 teaching **English, Bangla, and Arabic alphabets** plus **Animals, Fruits, and Vehicles**, with practice games, rewards, and a PIN-gated Parent Zone. Ad-free, offline-first, COPPA/GDPR-K-minded. Target: iOS 14+, Android 8+, phone + tablet.

The working directory `/Users/aiarnob/Herd/others/my-first-journey` is empty — this is a greenfield project. This plan covers **Phase 1 (MVP)** of the one-pager roadmap in full detail, structured so Phase 2/3 features slot in without rework.

## Tech Stack (verified current via context7, June 2026)

| Concern | Package | Why |
|---|---|---|
| Framework | Flutter stable (latest), Material 3 | Single codebase iOS/Android/tablet |
| State | `flutter_riverpod` ^3.3.0 | `Notifier`/`AsyncNotifier` + `ProviderScope`; easy test overrides |
| Navigation | `go_router` (latest) | Declarative, shallow routes suit toddler nav |
| Audio | `audioplayers` (latest) | Low-latency local asset playback, multiple concurrent players (tap sounds + voiceover) |
| Local DB | `drift` (latest) | Typed SQL for profiles/progress/streaks; reactive queries for dashboard |
| Settings | `shared_preferences` | Locale, reduced-motion, transliteration toggles |
| Animation | `flutter_animate`, `lottie` | Micro-interactions; celebration/character animations |
| L10n | `flutter_localizations` + `intl` (ARB files) | UI strings in en/bn/ar; automatic RTL via `Directionality` |
| Codegen | `build_runner`, `freezed`, `json_serializable` | Immutable content models from JSON |

| Icons/graphics | Material Symbols (built-in) + `flutter_svg` + `font_awesome_flutter` | **No emoji as icons anywhere in the UI** — emoji render inconsistently across platforms and look unpolished. Module glyphs, nav icons, and decorations use Material Symbols, Font Awesome, or custom SVG illustrations rendered via `flutter_svg` |

**Library policy:** every dependency must be well-maintained and popular — Flutter Favorite or Flutter-team-owned where possible, high pub.dev likes/points, active commits within recent months, and a significant GitHub star count. All packages above meet this bar (Riverpod ~6k★, drift ~3k★, audioplayers ~2k★, font_awesome_flutter ~3k★, flutter_svg/go_router/lottie/freezed are Flutter Favorites or ecosystem standards). Before adding any new package during implementation, check its pub.dev score and GitHub activity first; prefer a built-in Flutter API over a marginal package.

Run `flutter pub add <pkg>` for each so pub resolves the actual latest versions at implementation time — do not pin versions from memory.

## Design System (toddler-first)

**Colors — comfortable for young eyes.** Derive from the one-pager palette but soften: warm off-white backgrounds (`#FFFCF5` paper, `#FFF4E0` cream — never pure white, which is harsh on developing eyes), low-saturation pastels for surfaces (`leaf-soft #D8F0E2`, `sky-soft #DFEEFB`, `berry-soft #FBE0EA`, `grape-soft #ECE2FA`), with the saturated brand colors (coral `#FF6B4A`, mango `#FFB627`, leaf `#2E8B6A`, sky `#4A8FD8`, berry `#C84777`, grape `#7A4FBF`) reserved for interactive/focal elements only. Each module keeps its one-pager color identity (English=coral, Vehicles=grape, Bangla=leaf, Arabic=sky, Animals=mango, Fruits=berry) so pre-readers navigate by color. Module order in the app: 01 English, 02 Vehicles, 03 Bangla, 04 Arabic, 05 Animals, 06 Fruits. Dark ink `#1A1530` for text — high contrast without pure black.

**Toddler navigation rules** (encoded as core widgets, not per-screen):
- Tap targets ≥ 72dp; one primary action per screen; max 2 levels deep (Home → Module → Item)
- Zero reading required to navigate: color + icon + audio label on every nav element
- Every tap gives instant audio + bounce feedback (`flutter_animate` scale)
- Persistent oversized Home button (bottom-left); swipe left/right between items within a module
- No back-stack traps: hardware back always goes one level up
- Settings/Parent Zone behind PIN/math gate — never reachable by random tapping

**Typography:** `Baloo 2` (Latin — round, friendly), `Baloo Da 2` or `Hind Siliguri` (Bangla), `Noto Naskh Arabic` (Arabic with harakat support), `Lexend` as the dyslexia-friendly toggle font. Bundle as assets.

**Accessibility:** `reduced-motion` setting disables Lottie/auto-animations; all content widgets carry `Semantics` labels.

## Project Structure (feature-first)

```
lib/
  main.dart                      # ProviderScope + MaterialApp.router
  app/                           # router, theme, l10n config
  core/
    audio/                       # AudioService (voiceover + sfx channels)
    widgets/                     # BigTapButton, ModuleCard, LetterCard, StarBurst…
    db/                          # drift database, DAOs
    models/                      # freezed content models
  content/                       # ContentRepository: loads bundled JSON manifests
  features/
    home/                        # module picker grid
    alphabet/                    # ONE shared engine for en/bn/ar (config-driven)
    flashcards/                  # ONE shared engine for animals/fruits/vehicles
    games/                       # tracing, listen-and-tap, memory match
    rewards/                     # stars, streaks, stickers
    parent/                      # PIN gate, dashboard, settings
assets/
  content/{english,bangla,arabic,animals,fruits,vehicles}/manifest.json
  images/…   audio/{en,bn,ar,sfx}/…   fonts/…
```

**Key architectural decision — two reusable engines, six modules of data:**
- `AlphabetModule` engine renders any alphabet from a JSON manifest (letters, forms, example words, audio paths, tracing paths). English/Bangla/Arabic are *configurations*, not separate codebases. Arabic config adds `textDirection: rtl` and 4 letter forms; Bangla adds vowel/consonant tracks + transliteration toggle.
- `FlashcardModule` engine renders any categorized item set (groups, photo/illustration toggle, sound, trilingual names, fact bubble). Animals/Fruits/Vehicles are configurations.

This makes the "module by module" build mostly content + config after the engines exist.

## Module-by-Module Implementation Plan

### M0 — Project Foundation
- `flutter create` (org id, app name `little_letters`), set min SDK iOS 14 / Android 8 (API 26)
- Add all packages via `flutter pub add`; set up `build_runner` codegen, lints
- App shell: `ProviderScope` → `MaterialApp.router`, go_router with routes `/`, `/module/:id`, `/module/:id/item/:index`, `/parent`
- L10n scaffolding: `l10n.yaml`, ARB files for en/bn/ar, `supportedLocales`, locale provider
- Theme: `ThemeData` from the palette above, text themes per script, landscape+portrait support
- ✅ Verify: app boots to placeholder home in all 3 locales; Arabic locale flips to RTL

### M1 — Core Services & Design System
- `AudioService` (audioplayers): two channels — `voice` (interrupts previous) and `sfx` (overlapping); preload common sfx
- Drift schema: `profiles`, `lesson_progress` (moduleId, itemId, stars), `streaks`, `settings`
- `ContentRepository`: parse `manifest.json` per module into freezed models (`Letter`, `WordExample`, `FlashItem`)
- Core widgets: `BigTapButton` (72dp+, bounce+sound), `ModuleCard`, `StarRating`, `AppScaffold` (home button, no app bar)
- ✅ Verify: widget tests for tap feedback; drift unit tests for progress writes

### M2 — Home Screen
- 2×3 color-coded module grid (color+glyph+audio name on tap-and-hold, navigate on tap)
- Module glyphs: letterform glyphs (Aa / আ / ا) for alphabet modules, custom SVG illustrations (lion, mango, train via `flutter_svg`) for the others — no emoji
- Greeting with active kid profile avatar; subtle idle animations (disabled under reduced-motion)
- ✅ Verify: every module reachable in ≤1 tap; back from anywhere returns home

### M3 — English Alphabet (Module 01) — *builds the alphabet engine*
- Letter grid (26) → Letter detail: huge glyph, upper/lowercase toggle, letter-name + phonic audio buttons
- Example carousel: 3–5 photos per letter with word audio + letter-by-letter spelling reveal
- Swipe between letters; progress (visited/starred) written to drift
- Content: `english/manifest.json` + placeholder images/audio (real assets are a content-production task, tracked separately; build with TTS-generated placeholder audio + openly licensed photos)
- ✅ Verify: engine integration test with English manifest

### M4 — Vehicles (Module 02) — *builds the flashcard engine*
- Group chips (road/air/water/rail/work/emergency) → card grid → detail: photo⇄illustration toggle, authentic sound on tap (horn, engine, siren), names in 3 languages (tap each to hear)
- Animated motion preview: vehicle slides across screen (skipped under reduced-motion)
- ✅ Verify: engine integration test with vehicles manifest

### M5 — Bangla Alphabet (Module 03) — *alphabet engine reuse + config*
- স্বরবর্ণ (11) and ব্যঞ্জনবর্ণ (39) as two tracks/tabs in the letter grid
- Transliteration toggle (settings-backed); Bangla font rendering check on low-end Android
- যুক্তবর্ণ track stubbed (Phase 2)
- ✅ Verify: all 50 letters render correctly in Baloo Da 2/Hind Siliguri; audio plays per letter

### M6 — Arabic Alphabet (Module 04) — *engine reuse + RTL*
- 28 letters; detail screen shows isolated/initial/medial/final forms in a 4-chip row
- Example words rendered with harakat (Noto Naskh); optional en/bn meaning line
- Whole module wrapped in `Directionality(textDirection: TextDirection.rtl)`; swipe direction mirrored
- ✅ Verify: golden tests for RTL layout; forms render correctly (no broken shaping)

### M7 — Animals (Module 05) — *flashcard engine reuse*
- Group chips (pets/farm/wild/sea/birds/insects) → card grid → detail: photo⇄cartoon toggle, animal sound on tap, names in 3 languages (tap each to hear), fun-fact bubble (read aloud)

### M8 — Fruits (Module 06) — *engine reuse*
- Whole/sliced image toggle, color+taste tags as colored chips, seasonal grouping
- "Find the fruit" matching mini-game (reuses games engine from M9 if sequenced after; otherwise simple 3-option tap quiz)

### M9 — Practice & Games (cross-cutting, MVP set)
- **Tracing**: `CustomPainter` guide path (per-letter path data in manifest) + `GestureDetector` pan tracking with tolerance hit-testing; directional arrows + star checkpoints; completion celebration
- **Listen-and-tap quiz**: voice prompt → 3 image choices; wrong answers wiggle (never punish), right answer celebrates
- **Memory match**: pairs of letter↔image or image↔image cards
- Games take a module/items parameter — every module gets all games for free
- 1–3 star scoring written to `lesson_progress`
- ✅ Verify: tracing tolerance unit tests; game flow integration tests

### M10 — Rewards & Streaks
- Star totals per module, daily streak counter (local-date logic in drift), sticker unlocks at thresholds
- Celebration overlay (Lottie confetti, sound) — single reusable `CelebrationOverlay`
- Trophy room / avatar shop deferred to Phase 2 (leave sticker model extensible)

### M11 — Parent Zone
- Math-gate ("What is 7 × 3?") guarding `/parent`
- One kid profile for MVP (schema already supports 4): name, avatar pick
- Progress dashboard from drift reactive queries (per-module stars, streak)
- Settings: app language, transliteration, dyslexia font, reduced motion, screen-time limit (foreground timer → gentle "time to rest" screen)
- ✅ Verify: gate cannot be bypassed by back navigation; timer fires correctly

### M12 — Polish & Release Readiness
- Offline check: zero network calls at runtime (everything bundled); asset size audit (target < 150MB; move to deferred components/ODR only if exceeded)
- Tablet layouts (grid column counts via `LayoutBuilder`), orientation handling
- Privacy: no analytics/3p SDKs in MVP → clean COPPA/GDPR-K story; privacy policy doc
- App icons, splash (`flutter_native_splash`), store metadata
- ✅ Verify: full manual pass per module on iOS + Android device/emulator; `flutter analyze` + full test suite green

## Suggested Build Order & Dependencies

M0 → M1 → M2 → M3 English (alphabet engine) → M4 Vehicles (flashcard engine) → M9-tracing (validates alphabet engine early) → M5 Bangla → M6 Arabic → M7 Animals → M8 Fruits → M9-remaining games → M10 → M11 → M12.

## Out of Scope for MVP (one-pager Phase 2/3 — architecture leaves hooks)

Freemium IAP (`in_app_purchase` + parent gate), multi-profile, যুক্তবর্ণ track, trophy room/avatar shop, weekly email reports (needs backend — first server-side component), drag-to-spell + sound-to-image games, numbers/colors/shapes, storybooks, AR mode, voice repeat.

## Verification (end-to-end)

1. `flutter analyze` and `flutter test` clean after every module
2. Per-module manual check on emulator (`flutter run`): navigation by a "toddler protocol" — only large-element taps and swipes, no text reading required
3. Locale matrix: run app in en/bn/ar; confirm fonts, RTL mirroring, audio mapping
4. Golden tests for Letter detail (3 scripts) and module home
5. Final device pass: Android 8 low-end device profile + iPad layout
