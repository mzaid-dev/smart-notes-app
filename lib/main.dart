import 'package:flutter/material.dart';
import 'package:smart_notes_app/test1.dart';

import 'test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  EliteBackgroundUI(),
    );
  }
}
