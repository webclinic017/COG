import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_indicatos/InitialBindings.dart';

import 'Pages/TechnicalIndicatos.dart';
import 'Provider/technicalindicatorsprovider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      onInit: () async {
        await TechnicalIndicatorsProvider().getData(time: "1min");
      },
      getPages: [
        GetPage(
          name: "/",
          page: () => TechnicalIndicatos(),
        )
      ],
      initialBinding: InititlaBindings(),
      initialRoute: "/",
    );
  }
}
