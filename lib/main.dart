import 'package:example/navbar.dart';
import 'package:example/onboarding.dart';
import 'package:flutter/material.dart';
import 'complete.dart';
import 'package:gpt_3_dart/gpt_3_dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
  );

  final OpenAI openAI =
      new OpenAI(apiKey: "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");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: Onboarding(openAI),
    );
  }
}
