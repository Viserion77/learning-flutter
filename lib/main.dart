import 'package:flutter/material.dart';
import 'package:learning_flutter/screens/home.dart';

void main() {
  runApp(
    const LearnFlutter(),
  );
}

class LearnFlutter extends StatelessWidget {
  const LearnFlutter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}
