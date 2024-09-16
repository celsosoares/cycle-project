import 'package:flutter/material.dart';

class ProductBrought extends StatefulWidget {
  static const routeName = '/ProductBrought';
  const ProductBrought({super.key});

  @override
  State<ProductBrought> createState() => _ProductBroughtState();
}

class _ProductBroughtState extends State<ProductBrought> {
  @override
  void initState() {
    super.initState();
    _startRedirect();
  }

  void _startRedirect() {
    // Aguarda 4 segundos e redireciona para a tela "home"
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/ProductDelivery');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'images/image 4.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Compra confirmada com sucesso, obrigado por ajudar um futuro mais verde!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
