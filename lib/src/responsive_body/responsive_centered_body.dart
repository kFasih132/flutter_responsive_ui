import 'package:flutter/material.dart';

/// A widget that centers its [child] within a constrained width, making it
/// suitable for providing a responsive main content area.
///
/// This widget is useful for creating a centered layout that looks good on
/// both wide and narrow screens. It applies a `maxWidth` to the child,
/// preventing it from becoming too wide on desktop displays.
///
/// It can be styled with a [backgroundColor] or a [gradient].
class ResponsiveCenteredBody extends StatelessWidget {
  const ResponsiveCenteredBody({
    super.key,
    required this.child,
    this.backgroundColor,
    this.gradient,
    this.constraints,
    this.maxWidth = 640,
  }) : assert(backgroundColor == null || gradient == null,
            'Cannot provide both a color and a gradient.');

  /// The background color of the container.
  ///
  /// If a [gradient] is also provided, this color will be ignored.
  final Color? backgroundColor;

  /// A gradient to use for the background of the container.
  final Gradient? gradient;

  /// The widget to be centered and constrained.
  final Widget child;

  /// Optional constraints to apply to the child.
  ///
  /// These constraints are combined with [maxWidth].
  final BoxConstraints? constraints;

  /// The maximum width for the [child].
  ///
  /// Defaults to 640, a common breakpoint for mobile layouts.
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints:
            (constraints ?? const BoxConstraints()).copyWith(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
