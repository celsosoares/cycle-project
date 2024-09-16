import 'package:flutter/material.dart';
import 'pages/sign-in.dart';
import 'pages/sign-up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home.dart';
import 'pages/recommendations.dart';
import 'pages/welcome_page.dart';
import 'pages/donation.dart';
import 'pages/buying_product.dart';
import 'pages/confirm_buying.dart';
import 'pages/product_brought.dart';
import 'pages/product_delivery.dart';
import 'pages/address.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Cycle',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 16, 134, 0)),
      ),
      initialRoute: ConfirmBuying.routeName,
      routes: {
        ProductPage.routeName: (context) => const ProductPage(),
        WelcomePage.routeName: (context) => const WelcomePage(),
        SignInPage.routeName: (context) => const SignInPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        HomePage.routeName: (context) => HomePage(),
        DonationScreen.routeName: (context) => DonationScreen(),
        ListViewRecommendations.routeName: (context) =>
            const ListViewRecommendations(),
        ConfirmBuying.routeName: (context) => const ConfirmBuying(),
        ProductBrought.routeName: (context) => const ProductBrought(),
        ProductDelivery.routeName: (context) => const ProductDelivery(),
        AddressScreen.routeName: (context) => AddressScreen(),
      },
    );
  }
}
