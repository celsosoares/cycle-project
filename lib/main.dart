import 'package:flutter/material.dart';
import 'sign-in.dart';
import 'sign-up.dart';
import 'recommendations.dart';

void main() {
  runApp(MyApp());
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
          '/sign-up': (context) => Signup(),
          '/sign-in': (context) => Signin(),
          '/recommendations': (context) => ListViewRecommendations(),
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
            
          ),   
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/recommendations');
            },
            child: Text('Recomendações'),
            
          )                 
        ],
      ),
    );
  }
}
