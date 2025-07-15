# 🌐 Flutter Responsive UI

A clean and flexible way to build responsive layouts in Flutter across mobile, tablet, and desktop — with minimal boilerplate and powerful layout tools.

---

## ✨ Features

🧱 Simple, composable layout widgets  
📐 Screen-based constraints (`context.width`, `context.height`)  
🔡 Auto-scaling text with `context.scaleText(...)`  
🔀 Dynamic `Row`/`Column` layout with `ResponsiveSplitBody`  
🧩 `ResponsiveCenteredBody` for centered readable content  
⚙️ Customizable breakpoints  
🧠 Inherited context with `ResponsiveLayoutProvider`  
🧪 Built-in example app

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_responsive_ui: ^1.0.0
```

Import the package.
```dart
import 'package:flutter_responsive_ui/flutter_responsive_ui.dart';
```


## Usage

Wrap your app with ```ResponsiveLayoutProvider```` to access screen size in the widget tree:

```dart
void main() {
  runApp(
    const ResponsiveLayoutProvider(
      child: MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}
```

## 🧱 Core Widgets

### ✅ ```ResponsiveCenteredBody```
  Center your content and constrain its width (default maxWidth = 640).

  ```dart
  ResponsiveCenteredBody(
  maxWidth: 720,
  backgroundColor: Colors.grey[200],
  child: Text("Centered content"),
)
```
### 🔀 ResponsiveSplitBody
  Automatically switches between vertical and horizontal layout:

  ```dart
  ResponsiveSplitBody(
  primaryChild: Text("Primary"),
  secondaryChild: Text("Secondary"),
  gap: 16,
)
```

