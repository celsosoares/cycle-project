import 'package:flutter/material.dart';
import 'package:cycle_project/src/view/welcome_page.dart';
import 'package:cycle_project/src/shared/app_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettings.screenWidth = MediaQuery.of(context).size.width;
    AppSettings.screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Upcycle',
        theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.green),
        ),
        initialRoute: WelcomePage.routeName,
        routes: {
          WelcomePage.routeName: (context) => const WelcomePage(),
        });
  }
}
