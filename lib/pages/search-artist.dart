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
            Card(
              child: Column(
                children: [
                  Image.network('https://via.placeholder.com/150'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Artist Name 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      Text('City Name 1'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          Text('100 Sales'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star),
                          Text('50 Donations'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Column(
                children: [
                  Image.network('https://via.placeholder.com/150'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Artist Name 2', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      Text('City Name 2'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          Text('200 Sales'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star),
                          Text('75 Donations'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add other widgets below as needed
          ],
        ),
      ),
    );
  }
}
