import 'package:flutter/material.dart';
import 'package:shared_widgets/shared_widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BaseScaffold(
        initAnimationDelay: Durations.extralong4,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedContainer(
              duration: Durations.long1,
              curve: Curves.easeIn,
              width: 200,
              height: 200,
              color: Colors.greenAccent.withOpacity(0.5),
              child: const TextField(),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Close Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
