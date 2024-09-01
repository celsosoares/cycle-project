import 'package:cycle_project/pages/lorena-materials.dart';
import 'package:flutter/material.dart';
import 'pages/sign-in.dart';
import 'pages/sign-up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home.dart';
import 'pages/recommendations.dart';
import 'pages/welcome_page.dart';
import 'pages/donation.dart';
import 'pages/search-artist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: WelcomePage.routeName,
      routes: {
        WelcomePage.routeName: (context) => const WelcomePage(),
        SignInPage.routeName: (context) => const SignInPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        HomePage.routeName: (context) => HomePage(),
        DonationScreen.routeName: (context) => DonationScreen(),
        SearchArtistScreen.routeName: (context) => SearchArtistScreen(),
        LorenaMaterials.routeName: (context) => LorenaMaterials(),
        ListViewRecommendations.routeName: (context) =>
            const ListViewRecommendations(),
      },
    );
  }
}
