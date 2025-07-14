// The InheritedWidget that holds the screen size data.
import 'package:flutter/material.dart';

class ScreenSizeProvider extends InheritedWidget {
  const ScreenSizeProvider({
    super.key,
    required this.size,
    required super.child,
  });

  final Size size;

  /// Helper method to easily access the size from the context.
  static Size of(BuildContext context) {
    MediaQuery.textScalerOf(context);
    // This will find the nearest ScreenSizeProvider instance up the tree
    // and subscribe the widget to changes.
    final provider = context
        .dependOnInheritedWidgetOfExactType<ScreenSizeProvider>();
    assert(provider != null, 'No ScreenSizeProvider found in context');
    return provider!.size;
  }

  @override
  bool updateShouldNotify(ScreenSizeProvider oldWidget) {
    // The framework calls this method to determine if widgets that depend
    // on this InheritedWidget should be rebuilt. We want to rebuild
    // them only when the size has actually changed.
    return oldWidget.size != size;
  }
}

// Make sure to import the ScreenSizeProvider file you created above.
// import 'screen_size_provider.dart';

class ResponsiveLayoutProvider extends StatelessWidget {
  const ResponsiveLayoutProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // This is the ONLY place in your app that should directly call MediaQuery.sizeOf
    // for the purpose of layout calculation.
    final Size size = MediaQuery.sizeOf(context);

    // We pass the obtained size to our InheritedWidget.
    return ScreenSizeProvider(size: size, child: child);
  }
}

extension ScreenSizeContextExtension on BuildContext {
  double get width => ScreenSizeProvider.of(this).width;
  double get height => ScreenSizeProvider.of(this).height;
}
