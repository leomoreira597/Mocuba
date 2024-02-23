import 'package:flutter/material.dart';
import 'package:mocuba/view/pages/auth_page/auth_page.dart';
import 'package:mocuba/view/pages/loading_page/loading_page.dart';
import 'package:mocuba/view/widgets/auth_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}