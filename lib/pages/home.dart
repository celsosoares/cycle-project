import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';

  final List<Product> products = [
    Product('Camisa preta', 'R\$29,90', 'Lorena Silva', 5, 'images/clothes.png'),
    Product('Acessorios', 'R\$45,00', 'Camila Souza', 5, 'images/accessories.png'),
    Product('Sapatos', 'R\$35,00', 'Camila Souza', 5, 'images/shoes.png'),
    Product('Guarda-chuva', 'R\$40,00', 'Camila Souza', 5, 'images/bags.png'),
    Product('Pneu', 'R\$40,00', 'Camila Souza', 5, 'images/google.png'),
    Product('Decoração', 'R\$40,00', 'Camila Souza', 5, 'images/furniture.png'),
    Product('Prato', 'R\$40,00', 'Camila Souza', 5, 'images/crafts.png'),
    Product('Maça', 'R\$40,00', 'Camila Souza', 4, 'images/apple.png'),
    Product('Porta', 'R\$40,00', 'Camila Souza', 5, 'images/utensils.png'),
    Product('Televisão', 'R\$40,00', 'Camila Souza', 5, 'images/facebook.png'),
  ];

  final List<OfferItem> offerItems = [
    OfferItem(
      'images/lorena.png',
      'Lorena Silva',
      'Lorena Silva é uma vendedora apaixonada por sustentabilidade e inovação...',
    ),
    OfferItem('images/accessories.png', 'Camila Soares', ''),
    OfferItem('images/accessories.png', 'Roberta Lima', ''),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get screen size for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Olá, Vinícius',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pushNamed('/PointsListPage');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Meus pontos',
                style: GoogleFonts.lato(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(  // Wrap the entire body in SingleChildScrollView for scrolling
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Descubra novos artistas',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: screenWidth * 0.5, // 50% height of the screen width
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: offerItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.shade400,
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Ensure the column only takes necessary space
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.network(
                                offerItems[index].icon,
                                width: screenWidth * 0.4, // Adjust width based on screen
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Text(
                              offerItems[index].text,
                              style: GoogleFonts.lato(
                                fontSize: screenWidth * 0.05, // Scalable font size
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                            child: Text(
                              offerItems[index].description,
                              style: GoogleFonts.lato(
                                fontSize: screenWidth * 0.035, // Scalable font size
                                color: Colors.grey.shade700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: offerItems.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categorias',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCategoryCard(screenWidth, 'images/clothes.png', 'Roupas'),
                _buildCategoryCard(screenWidth, 'images/accessories.png', 'Acessórios'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Você pode gostar',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true, // Make the GridView take only the needed space
                physics: NeverScrollableScrollPhysics(), // Disable scrolling for GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 600 ? 3 : 2, // Responsive columns
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8, // Make cards slightly taller
                ),
                padding: EdgeInsets.all(8.0),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.network(
                            products[index].image,
                            height: screenWidth * 0.2,
                            width: double.infinity,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                products[index].name,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.04, // Scalable font size
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(products[index].seller),
                              SizedBox(height: 7),
                              Text(products[index].price),
                              SizedBox(height: 3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...List.generate(
                                    products[index].rating,
                                    (i) => Icon(Icons.star, color: Colors.amber),
                                  ),
                                  ...List.generate(
                                    5 - products[index].rating,
                                    (i) => Icon(Icons.star_border),
                                  ),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
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
        ],
      ),
    );
  }

  Widget _buildCategoryCard(double screenWidth, String imagePath, String label) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black),
        ),
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: ListTile(
          leading: Image.network(imagePath, width: screenWidth * 0.1),
          title: Text(label),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String seller;
  final int rating;
  final String image;

  Product(this.name, this.price, this.seller, this.rating, this.image);
}

class OfferItem {
  final String icon;
  final String text;
  final String description;

  OfferItem(this.icon, this.text, this.description);
}
