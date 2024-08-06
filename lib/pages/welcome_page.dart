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
        Navigator.pushNamed(context, '/SignIn');
      }
    });
  }

  void goToPreviousPage() {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String finalPageButton = 'Próximo';
    Widget pageWidget;

    if (currentPage == 0) {
      pageWidget = const PageOne();
    } else if (currentPage == 1) {
      pageWidget = const PageTwo();
    } else {
      pageWidget = const PageThree();
    }

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pageIndicator,
                  ),
                  if (currentPage == 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          minimumSize: const Size(100, 40),
                        ),
                        onPressed: goToNextPage,
                        child: Text(
                          finalPageButton,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (currentPage != 0) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: SizedBox(
                      height: 40,
                      child: TextButton(
                        onPressed: goToPreviousPage,
                        child: const Text(
                          "Anterior",
                          style: TextStyle(
                            color: Color.fromARGB(221, 63, 62, 62),
                            fontSize: 14,
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
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          minimumSize: const Size(100, 40),
                        ),
                        onPressed: goToNextPage,
                        child: Text(
                          finalPageButton,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
