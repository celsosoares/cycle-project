import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  static const routeName = '/DonationScreen';

  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  appBar: AppBar(
		title: Text('Donation Screen'),
	  ),
	  body: Center(
		child: Container(
		  width: 100,
		  height: 100,
		  color: Colors.green,
		  child: Center(
			child: Text(
			  'Sample Text',
			  style: TextStyle(
				color: Colors.white,
				fontSize: 16,
			  ),
			  textAlign: TextAlign.center,
			),
		  ),
		),
	  ),
	);
  }
}
