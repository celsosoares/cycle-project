import 'package:flutter/material.dart';

class SearchArtistScreen extends StatelessWidget {
  static const routeName = '/SearchArtistScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisar Artista'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Pesquisar Artista',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Add your search logic here
              },
            ),
            SizedBox(height: 16.0),
            
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/LorenaMaterialsScreen');
              },
              child: Card(
                child: Column(
                  children: [
                    Image.asset('images/lorena.png'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Lorena Silva', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on),
                        Text('Recife, pe'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.shopping_cart),
                            Text('100 vendas'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star),
                            Text('50 doações'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/LorenaMaterialsScreen');
              },
              child: Card(
                child: Column(
                  children: [
                    Image.asset('images/matheus.png'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Matheus Henrique', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on),
                        Text('Recife, PE'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.shopping_cart),
                            Text('200 vendas'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star),
                            Text('75 doações'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Add other widgets below as needed
          ],
        ),
      ),
    );
  }
}
