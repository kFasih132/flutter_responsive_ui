import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/responsive_ui_kit.dart';

class ResponsiveSplitExample extends StatelessWidget {
  const ResponsiveSplitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Split Body Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveSplitBody(
          gap: 24,
          primaryFlex: 2,
          secondaryFlex: 1,
          crossAxisAlignment: CrossAxisAlignment.start,
          // Optional: forceVerticalLayout: true, // or you can provide your own break logic
          primaryChild: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blueAccent,
            child: const Text(
              'Primary Section\n\nThis takes more space on wider screens.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          secondaryChild: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.green,
            child: const Text(
              'Secondary Section\n\nThis stacks below or goes to the side.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
