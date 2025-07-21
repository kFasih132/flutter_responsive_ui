import 'package:example/centered_body.dart';
import 'package:example/resp_size_page.dart';
import 'package:example/responsive_split_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/responsive_ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RespSizesPage()),
                );
              },
              child: Text('Resp size'),
            ),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CenteredBodyPage()),
                );
              },
              child: Text('Centered body size'),
            ),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResponsiveSplitExample(),
                  ),
                );
              },
              child: Text('Split body size'),
            ),
          ],
        ),
      ),
    );
  }
}


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



class RespSizesPage extends StatelessWidget {
  const RespSizesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'text widget scaling with screen size',
              style: TextStyle(
                color: Colors.amber,
                fontSize: getRespSize(context, size: TextSizes.titleMedium),
              ),
            ),
            Icon(Icons.home, size: getRespSize(context, size: 22)),
            ContainerText(
              data: 'without scaling for reference ',
              txtSize: TextSizes.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerText extends StatelessWidget {
  const ContainerText({super.key, required this.data, required this.txtSize});
  final String data;
  final double txtSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlueAccent,
      ),
      child: Text(data, style: TextStyle(fontSize: txtSize)),
    );
  }
}


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

