import 'package:flutter/material.dart';
import 'pages/sign-in.dart';
import 'pages/sign-up.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 

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
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 16, 134, 0)),
        ),
        home: MyHomePage(),
        routes: {
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
        },
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Apenas testando'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text('Tela de cadastro'),
            
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text('Tela de login'),
            
          )         
        ],
      ),
    );
  }
}
