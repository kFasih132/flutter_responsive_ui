import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/flutter_responsive_ui.dart';

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
