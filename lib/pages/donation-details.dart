import 'package:flutter/material.dart';

class DonationDetails extends StatelessWidget {
  static const routeName = '/DonationDetailsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Doação'),
      ),
      body: Align(
        alignment: Alignment.topCenter,  // Aligns the Card at the top
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min, // Adjust the height based on the content
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/lorena.png'), // Replace with your image path
                              radius: 30,
                            ),
                            SizedBox(width: 20), // Adjust the width to move the text to the right
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
                                children: [
                                  Text(
                                    'Lorena Silva',
                                    style: TextStyle(color: Colors.white, fontSize: 24),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Transformando materiais descartados em peças de moda únicas e conscientes!✨🌿\n'
                          'Designer de moda e defensora do upcycling.\n'
                          'Explore minha coleção exclusiva de roupas e acessórios feitos à mão, cada um contando sua própria história de renovação e sustentabilidade.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Add some space after the card
              Text(
                'Informações do Material',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20), // Add some space before the new card
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/sheets.png'), // Replace with your image path
                          radius: 30,
                        ),
                        SizedBox(width: 20), // Adjust the width to move the text to the right
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lençol',
                                style: TextStyle(color: Colors.black, fontSize: 24),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'tecido',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'pontos: 40',
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Add some space after the card
              Text(
                'Você ganhará 40 pontos com essa doação',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20), // Add some space before the button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/DonationConfirmationScreen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded borders
                  ),
                  minimumSize: Size(200, 50), // Set minimum size
                ),
                child: Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white, fontSize: 18), // Text color and size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
