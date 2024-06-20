import 'package:base_project_flutter/export.dart';

//TODO: Understand Usage First
extension SliverExtension on Widget {
  Widget sliver() => SliverToBoxAdapter(child: this);
}

// https://m2.material.io/design/layout/responsive-layout-grid.html#breakpoints
class Breakpoints {
  static const double xs = 600.0; // Extra-small (phone)
  static const double sm = 905.0; // Small (tablet)
  static const double md = 1240.0; // Medium (laptop)
  static const double lg = 1440.0; // Large (desktop)
  static const double xl = 1920.0; // Extra-large (large desktop)
}

//TODO: Understand Usage First
extension Margins on BuildContext {
  double get margin {
    final dpr = MediaQuery.of(this).devicePixelRatio;
    final width = MediaQuery.of(this).size.width / dpr;
    if (width < Breakpoints.xs) {
      return 16;
    } else if (width < Breakpoints.sm) {
      return 32;
    } else if (width < Breakpoints.md) {
      return 32;
    } else if (width < Breakpoints.lg) {
      return 200;
    } else {
      return 0;
    }
  }

  Widget marginBox(Widget child) {
    return Padding(
      padding: EdgeInsets.all(margin),
      child: child,
    );
  }
}
