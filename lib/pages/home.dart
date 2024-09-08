import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';
  final List<Product> products = [
    Product(
        'Camisa preta', 'R\$29,90', 'Lorena Silva', 5, 'images/clothes.png'),
    Product(
        'Acessorios', 'R\$45,00', 'Camila Souza', 5, 'images/accessories.png'),
    Product('Sapatos', 'R\$35,00', 'Camila Souza', 5, 'images/shoes.png'),
    Product('Guarda-chuva', 'R\$40,00', 'Camila Souza', 5, 'images/bags.png'),
    Product('Pneu', 'R\$40,00', 'Camila Souza', 5, 'images/google.png'),
    Product('Decoração', 'R\$40,00', 'Camila Souza', 5, 'images/furniture.png'),
    Product('Prato', 'R\$40,00', 'Camila Souza', 5, 'images/crafts.png'),
    Product('Maça', 'R\$40,00', 'Camila Souza', 4, 'images/apple.png'),
    Product('Porta', 'R\$40,00', 'Camila Souza', 5, 'images/utensils.png'),
    Product('Televisão', 'R\$40,00', 'Camila Souza', 5, 'images/facebook.png'),
    // Adicione outros produtos seguindo a mesma estrutura
  ];
  final List<OfferItem> offerItems = [
  OfferItem('images/lorena.png', 'Lorena Silva','Lorena Silva é uma vendedora apaixonada por sustentabilidade e inovação. Ela trabalha com produtos feitos de upcycling, transformando resíduos e materiais descartados em itens de maior valor e utilidade. Com um olhar atento para a moda e o design, Maria seleciona cuidadosamente peças únicas que contam histórias de transformação e criatividade.'),
  OfferItem('images/accessories.png', 'Camila Soares',''),
  OfferItem('images/accessories.png', 'Roberta Lima',''),
  // Add more items as needed
];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text('Olá, Vinícius'),
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.of(context).pushNamed('/PointsListPage');
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text('Meus pontos'), // Substitua pelo nome do usuário
        ),
      ],
    ),
    body: Center(
      child: Column(
        children: [
          // Existing PageView
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Descubra novos artistas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 300, // Set a fixed height for the card list
            child: PageView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              itemCount: offerItems.length, // Number of items
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0), // Padding around the card
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black), // Border color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Padding inside the card
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Center alignment
                        children: [
                          // Icon at the top
                          Image.network(offerItems[index].icon),
                          SizedBox(height: 10), // Space between icon and text
                          // Text below the icon
                          Text(
                            offerItems[index].text, // Dynamic text
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center, // Center the text
                          ),
                          Text(
                            offerItems[index].description, // Dynamic text
                            style: TextStyle(
                              fontSize: 14, 
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center, // Center the text
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Title for the new cards
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Categorias',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Row to place cards side by side
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // First new card
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  child: ListTile(
                    leading: Image.network('images/clothes.png'),
                    title: Text('Roupas'),
                  ),
                ),
              ),
              
              // Second new card
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: ListTile(
                    leading: Image.network('images/accessories.png'),
                    title: Text('Acessórios'),
                  ),
                ),
              ),
            ],
          ),

           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Você pode gostar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Existing ListView
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 100.0), // Margin for spacing
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 8, // Reduced space between columns
                  mainAxisSpacing: 8, // Reduced space between rows
                  childAspectRatio: 1.5, // Adjust to make items square or rectangular
                ),
                padding: EdgeInsets.all(8.0), // Padding around the grid
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1), // Thinner border
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    margin: const EdgeInsets.all(4.0), // Smaller margin inside grid cells
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Image at the top
                        Image.network(
                          products[index].image,
                          height: 100, // Adjust the height of the image // Fit the image within the container
                        ),
                        // Padding between the image and the text
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                products[index].name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 3),
                              Text(products[index].seller),
                              SizedBox(height: 7),
                              Text(products[index].price),
                              SizedBox(height: 3),
                              Row(
                                children: [
                                  ...List.generate(products[index].rating, 
                                      (i) => Icon(Icons.star, color: Colors.amber)),
                                  ...List.generate(5 - products[index].rating, 
                                      (i) => Icon(Icons.star_border)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      fixedColor: Colors.grey[850],
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
        // Adicione mais itens conforme necessário
      ],
    ),
  );
}
}

class Product {
  String name;
  String price;
  String seller;
  int rating;
  String image;

  // Adicione imageUrl se você tiver imagens hospedadas online.
  // String imageUrl;

  Product(this.name, this.price, this.seller, this.rating, this.image);
}

class OfferItem {
  final String icon;
  final String text;
  final String description;

  OfferItem(this.icon, this.text,this.description);
}

