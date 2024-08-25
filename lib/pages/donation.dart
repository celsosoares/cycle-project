import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  static const routeName = '/DonationScreen';

  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  appBar: AppBar(
		title: Text('Como você gostaria de doar?'),
	  ),
	  body: Column(
		mainAxisAlignment: MainAxisAlignment.start,
		children: [
		  Center(
			child: Padding(
			  padding: EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
			  child: Container(
				decoration: BoxDecoration(
				  color: Colors.green,
				  borderRadius: BorderRadius.circular(20),
				),
				padding: EdgeInsets.all(16.0),
				child: Text(
				  'Como funciona?\n'
				  'Caso você tenha algum material que queira doar, selecione Quero doar um material específico e veja quais designers estão precisando desse material.\n\n'
				  'Caso você conheça ou se interessou por algum designer da plataforma, selecione Quero doar para um designer específico e veja quais materiais esse designer precisa.\n\n'
				  'Após confirmar o pedido de doação, entre em contato com o designer para a entrega dos materiais, você receberá os pontos quando o designer receber e validar a doação.',
				  style: TextStyle(
					color: Colors.white,
					fontSize: 16,
				  ),
				  textAlign: TextAlign.center,
				  maxLines: null,
				  overflow: TextOverflow.visible,
				),
			  ),
			),
		  ),
		],
	  ),
	);
  }
}
