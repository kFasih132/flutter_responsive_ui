import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/flutter_responsive_ui.dart';



  /// Calculates a responsive size by applying a scaling factor based on screen width.
  ///
  /// This method is useful for scaling UI elements like padding, margins, text sizes, or icons.
   double getRespSize(
    BuildContext context, {
    required double size,
    BreakPoints breakPoints = const BreakPoints(),
    TextScalingValues scaleValues = const (
      xs: 0.7,
      s: 0.95,
      m: 1.0,
      l: 1.3,
      xL: 1.6,
    ),
  }) {
    final width = ScreenSizeProvider.of(context).width;
    final scaleFactor = _getScaleFactor(width, breakPoints, scaleValues);
    return size * scaleFactor;
  }

  /// Calculates a responsive text size that also respects the user's system text scaling settings.
  ///
  /// This method should be used for font sizes to ensure accessibility.
   double getRespTxtSizeWithTextScaler(
    BuildContext context, {
    required double size,
    BreakPoints breakPoints = const BreakPoints(),
    TextScalingValues scaleValues = const (
      xs: 0.75,
      s: 0.95,
      m: 1.0,
      l: 1.2,
      xL: 1.4,
    ),
  }) {
    final width = ScreenSizeProvider.of(context).width;
    final scaleFactor = _getScaleFactor(width, breakPoints, scaleValues);
    final responsiveSize = size * scaleFactor;
    return MediaQuery.textScalerOf(context).scale(responsiveSize);
  }

  /// Determines the appropriate scaling factor from [scaleValues] based on the screen [width]
  /// and defined [breakPoints].
   double _getScaleFactor(
    double width,
    BreakPoints breakPoints,
    TextScalingValues scaleValues,
  ) {
    if (width <= breakPoints.xsMobileWidth) {
      return scaleValues.xs;
    } else if (width < breakPoints.sMobileWidth) {
      return scaleValues.s;
    } else if (width < breakPoints.maxMobileWidth) {
      return scaleValues.m;
    } else if (width < breakPoints.maxTabletWidth) {
      return scaleValues.l;
    } else {
      return scaleValues.xL;
    }
  }


/// A record type defining scaling values for different screen size categories.
typedef TextScalingValues = ({
  double xs, /// Extra Small
  double s, /// Small
  double m, /// Medium
  double l, /// Large
  double xL, /// Extra Large
});
