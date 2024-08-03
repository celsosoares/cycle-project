import 'package:flutter/material.dart';
import 'pages/sign-in.dart';
import 'pages/sign-up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home.dart';
import 'pages/recommendations.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cycle',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 16, 134, 0)),
      ),
      initialRoute: SignInPage.routeName,
      routes: {
        SignInPage.routeName: (context) => const SignInPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        HomePage.routeName: (context) => HomePage(),
        ListViewRecommendations.routeName: (context) =>
            const ListViewRecommendations()
      },
    );
  }
}
