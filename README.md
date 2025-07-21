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
  responsive_ui_kit : ^0.0.2
```

Import the package.
```dart
import 'package:flutter_responsive_ui/responsive_ui_kit.dart';
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
### 🔀 ```ResponsiveSplitBody```
  Automatically switches between vertical and horizontal layout:

  ```dart
  ResponsiveSplitBody(
  primaryChild: Text("Primary"),
  secondaryChild: Text("Secondary"),
  gap: 16,
)
```

Force layout direction:

```dart
ResponsiveSplitBody(
  forceVerticalLayout: true, // Always vertical
)
```
Custom breakpoints:
            use maxMobileWidth property of ```BreakPoints```
  ```dart
   ResponsiveSplitBody(
  breakPoints: BreakPoints(maxMobileWidth: 700),
)
```

## 📐 Context Extensions
  - Use helpful extensions anywhere:

```dart
final screenWidth = context.width;
final screenHeight = context.height;
```
## Global method for scalable sizes

 

```dart
    Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'text widget scaling with screen size',
              style: TextStyle(
                color: Colors.amber,
                // getRespSize will scale your given size according to screen size and TextSizes is class where you can some standarad 
                //text sizes
                fontSize: getRespSize(context, size: TextSizes.titleMedium),
                // TextScalingValues parameter to control of scaling 

              ),
            ),
            Icon(Icons.home, size: getRespSize(context, size: 22))
          ],
        ),

```
## 🛠️ Configuration
 
| Feature           |      Usage                   |
|-------------------|:------------------------------------------:|
| Max width | 	ResponsiveCenteredBody(maxWidth: ...) | 
| Custom breakpoints |   BreakPoints(maxMobileWidth: ...)  |  
| Gap between children |gap: 20 in ResponsiveSplitBody |   
| Flex ratios |  primaryFlex, secondaryFlex   |  
| Cross axis alignment |	crossAxisAlignment: CrossAxisAlignment.start |   

## 💬 Support 

-  🐛 Issues → https://github.com/kFasih132/flutter_responsive_ui
-  📖 Docs → This README + example app
-  🌟 Like it? Star it on pub.dev


#### Built with ❤️ by Fasih us Rehman for the Flutter community