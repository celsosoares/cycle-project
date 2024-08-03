import 'package:flutter/material.dart';
import 'welcome_contents.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const routeName = '/WelcomePage';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentPage = 0;

  void goToNextPage() {
    setState(() {
      if (currentPage < 2) {
        currentPage++;
      } else {
        Navigator.pushNamed(context, '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String finalPageButton = 'Avançar';
    Widget pageWidget = Container();

    ''' if (currentPage == 0) {
      pageWidget = PageOne();
    } else if (currentPage == 1) {
      pageWidget = PageTwo();
    } else if (currentPage == 2) {
      pageWidget = PageThree();
    }''';

    List<Widget> pageIndicator = List.generate(
      3,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          pageWidget,
          Positioned(
            top: 0,
            bottom: 0,
            right: 100,
            left: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 500.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageIndicator,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/SignIn');
                      },
                      child: const Text(
                        "Pular",
                        style: TextStyle(
                          color: Color.fromARGB(221, 63, 62, 62),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: SizedBox(
                    width: 100,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        goToNextPage();
                      },
                      child: Text(
                        finalPageButton,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
