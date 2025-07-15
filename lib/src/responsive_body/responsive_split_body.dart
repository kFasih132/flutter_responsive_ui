import 'package:flutter/material.dart';
import 'package:responsive_ui_kit/responsive_ui_kit.dart';

/// A widget that displays two children in either a [Row] or a [Column]
/// depending on screen width or a forced layout direction.
///
/// On smaller screens (like mobile), it arranges children vertically using a [Column].
/// On larger screens, it arranges them horizontally using a [Row].
///
/// You can override this behavior using the [forceVerticalLayout ] flag.
///
/// Optionally, you can define [gap] between children and control layout alignment
/// using [crossAxisAlignment].
class ResponsiveSplitBody extends StatefulWidget {
  const ResponsiveSplitBody({
    super.key,
    required this.primaryChild,
    required this.secondaryChild,
    this.primaryFlex = 1,
    this.secondaryFlex = 1,
    this.forceVerticalLayout  ,
    this.gap = 20,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.breakPoints = const BreakPoints(),
  });
  /// Alignment of children along the cross axis (vertical in Row, horizontal in Column).
  final CrossAxisAlignment crossAxisAlignment;
  /// The space between the two children.
  final double gap;

  /// The first child to display (top in Column, left in Row).
  ///
  /// If layout is horizontal, this child is wrapped in a [Flexible] with [primaryFlex]
  final Widget primaryChild;

  /// The second child to display (bottom in Column, right in Row).
  ///
  /// If layout is horizontal, this child is wrapped in a [Flexible] with [secondaryFlex].
  final Widget secondaryChild;

  /// The flex factor for the [primaryChild].
  final int primaryFlex;

  /// The flex factor for the [secondaryChild].
  final int secondaryFlex;

  /// An optional boolean to override the responsive behavior.
  ///
  /// If `true`, a [Column] layout is used.
  /// If `false`, a [Row] layout is used.
  /// If `null` (default), the layout is determined by the screen width and data member of [breakPoints]  named maxMobileWidth.
  final bool? forceVerticalLayout  ;

  /// The screen width breakpoints to use for determining the layout.
  final BreakPoints breakPoints;

  @override
  State<ResponsiveSplitBody> createState() => _ResponsiveSplitBodyState();
}

class _ResponsiveSplitBodyState extends State<ResponsiveSplitBody> {
  @override
  void didUpdateWidget(covariant ResponsiveSplitBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.forceVerticalLayout != oldWidget.forceVerticalLayout) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    final children = [
      Flexible(flex: widget.primaryFlex, child: widget.primaryChild),
      Flexible(flex: widget.secondaryFlex, child: widget.secondaryChild),
    ];

    return Builder(
      builder: (context) {
        final width = ScreenSizeProvider.of(context).width;
        final useColumn =
            widget.forceVerticalLayout   ?? width < widget.breakPoints.maxMobileWidth;

        return useColumn
            ? SingleChildScrollView(
                child: Column(
                  spacing: widget.gap,
                  crossAxisAlignment: widget.crossAxisAlignment,
                  children: [widget.primaryChild, widget.secondaryChild],
                ),
              )
            : Row(
                spacing: widget.gap,
                crossAxisAlignment: widget.crossAxisAlignment,
                children: children,
              );
      },
    );
  }
}
