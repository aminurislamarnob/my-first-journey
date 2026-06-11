import 'package:go_router/go_router.dart';

import '../features/alphabet/letter_detail_screen.dart';
import '../features/alphabet/letter_grid_screen.dart';
import '../features/flashcards/flashcard_detail_screen.dart';
import '../features/flashcards/flashcard_grid_screen.dart';
import '../features/home/home_screen.dart';

/// Shallow route tree — toddler navigation never goes more than two
/// levels below home, and hardware back always climbs exactly one level.
final appRouter = createRouter();

/// Factory so tests can build an isolated router at any start location.
GoRouter createRouter({String initialLocation = '/'}) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'alphabet/:moduleId',
          builder: (context, state) => LetterGridScreen(
            moduleId: state.pathParameters['moduleId']!,
          ),
          routes: [
            GoRoute(
              path: 'letter/:index',
              builder: (context, state) => LetterDetailScreen(
                moduleId: state.pathParameters['moduleId']!,
                initialIndex:
                    int.tryParse(state.pathParameters['index'] ?? '') ?? 0,
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'cards/:moduleId',
          builder: (context, state) => FlashcardGridScreen(
            moduleId: state.pathParameters['moduleId']!,
          ),
          routes: [
            GoRoute(
              path: 'item/:itemId',
              builder: (context, state) => FlashcardDetailScreen(
                moduleId: state.pathParameters['moduleId']!,
                itemId: state.pathParameters['itemId']!,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
