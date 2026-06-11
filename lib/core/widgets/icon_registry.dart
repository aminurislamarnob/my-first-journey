import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Maps semantic icon names from content manifests to real icon glyphs
/// (Material Symbols first, Font Awesome where Material has no match).
///
/// Items without a mapping fall back to letter art in [ContentImage] —
/// never to emoji. Font Awesome 11 uses its own [FaIconData] type, so the
/// registry hands out ready-made widgets rather than raw icon data.
abstract final class IconRegistry {
  static const _icons = <String, Object>{
    // vehicles
    'car': Icons.directions_car_rounded,
    'bus': Icons.directions_bus_rounded,
    'school_bus': Icons.directions_bus_filled_rounded,
    'taxi': Icons.local_taxi_rounded,
    'motorcycle': Icons.two_wheeler_rounded,
    'bicycle': Icons.pedal_bike_rounded,
    'scooter': Icons.electric_scooter_rounded,
    'truck': Icons.local_shipping_rounded,
    'van': Icons.airport_shuttle_rounded,
    'airplane': Icons.flight_rounded,
    'helicopter': FontAwesomeIcons.helicopter,
    'rocket': Icons.rocket_launch_rounded,
    'boat': Icons.directions_boat_rounded,
    'ship': FontAwesomeIcons.ship,
    'sailboat': Icons.sailing_rounded,
    'ferry': Icons.directions_ferry_rounded,
    'train': Icons.train_rounded,
    'metro': Icons.subway_rounded,
    'tram': Icons.tram_rounded,
    'tractor': Icons.agriculture_rounded,
    'crane': Icons.precision_manufacturing_rounded,
    'garbage_truck': Icons.recycling_rounded,
    'fire_truck': Icons.fire_truck_rounded,
    'ambulance': FontAwesomeIcons.truckMedical,
    'police_car': Icons.local_police_rounded,
    // groups
    'road': FontAwesomeIcons.road,
  };

  static bool has(String? name) => name != null && _icons.containsKey(name);

  static Widget? widget(
    String? name, {
    required double size,
    required Color color,
  }) {
    return switch (_icons[name]) {
      final IconData data => Icon(data, size: size, color: color),
      final FaIconData data => FaIcon(data, size: size, color: color),
      _ => null,
    };
  }
}
