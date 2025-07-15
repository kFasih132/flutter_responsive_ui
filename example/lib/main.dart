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
