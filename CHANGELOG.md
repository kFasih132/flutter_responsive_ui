## 0.0.1

### 2025-07-15

🎉 Initial release of `flutter_responsive_ui`

### ✨ Added

- `ResponsiveLayoutProvider`: Inherited widget to provide screen size throughout the widget tree
- `ScreenSizeProvider`: Internal mechanism for accessing screen dimensions
- `getRespSize`: for scalable sizes
- Extensions on `BuildContext`:
  - `context.width`, `context.height` — quick screen dimension access
- `ResponsiveCenteredBody`: A centered layout widget with a customizable maxWidth, background color, or gradient
- `ResponsiveSplitBody`: Automatically switches between `Row` and `Column` layout based on screen width or an override
  - Supports custom gap, flex values, cross-axis alignment, and breakpoints
- `BreakPoints` class: Allows developers to customize responsive behavior thresholds

---

📦 This version provides the foundation for building responsive UI in Flutter with minimal effort. Designed to work across mobile, tablet, desktop, and web platforms.
