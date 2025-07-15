import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/responsive_ui_kit.dart';

class CenteredBodyPage extends StatelessWidget {
  const CenteredBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Responsive Centered Body')),
      body: ResponsiveCenteredBody(
        backgroundColor: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Screen Width: ${screenWidth.toStringAsFixed(0)} px',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Text(
                'This content is centered and will never exceed 640px width, '
                'no matter how wide the screen gets.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              ElevatedButton(onPressed: () {}, child: const Text('Try Me')),
            ],
          ),
        ),
      ),
    );
  }
}
