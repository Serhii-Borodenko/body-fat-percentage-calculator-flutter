import 'package:flutter/material.dart';
import 'components/input_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: Color(0xfffafafa),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputScreen(),
      },
    );
  }
}
