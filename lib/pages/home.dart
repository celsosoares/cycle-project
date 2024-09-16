import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';

  final List<Product> products = [
    Product('Camisa preta', 'R\$22,90', 'Lorena Silva', 5, 'images/camisa.png'),
    Product('Acessorios', 'R\$45,00', 'Camila Souza', 5, 'images/accessories.png'),
    Product('Sapatos', 'R\$35,00', 'Camila Souza', 5, 'images/shoes.png'),
    Product('Guarda-chuva', 'R\$40,00', 'Camila Souza', 5, 'images/bags.png'),
    Product('Decoração', 'R\$40,00', 'Camila Souza', 5, 'images/furniture.png'),
    Product('Artesanato', 'R\$40,00', 'Camila Souza', 5, 'images/crafts.png'),
    Product('Utensilios', 'R\$40,00', 'Camila Souza', 5, 'images/utensils.png'),
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
          onPressed: () => Navigator.of(context).pushNamed('/SignIn'),
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
      body: SingleChildScrollView(
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.network(
                                offerItems[index].icon,
                                width: screenWidth * 0.4,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Text(
                              offerItems[index].text,
                              style: GoogleFonts.lato(
                                fontSize: screenWidth * 0.05,
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
                                fontSize: screenWidth * 0.035,
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
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 600 ? 3 : 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                padding: EdgeInsets.all(8.0),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle product tap action here
                      print('Tapped on product: ${products[index].name}');
                      Navigator.of(context).pushNamed('/BuyProduct');
                    },
                    child: Card(
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
                                    fontSize: screenWidth * 0.04,
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
            label: 'Doar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 0, // Set this to the currently selected index
        onTap: (index) {
          // Handle navigation logic here based on the index
          if (index == 0) {
            Navigator.of(context).pushNamed('/HomePage');
          } else if (index == 1) {
            Navigator.of(context).pushNamed('/DonationScreen');
          } else if (index == 2) {
            Navigator.of(context).pushNamed('/ProfilePage');
          }
        },
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
