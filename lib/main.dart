import 'package:flutter/material.dart';

import 'Pages/TechnicalIndicatos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technical Indicatos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0x00000000),
          canvasColor: Colors.black,
        
          ),
      home: TechnicalIndicatos(),
    );
  }
}
