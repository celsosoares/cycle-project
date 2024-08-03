import 'package:flutter/material.dart';
import 'package:cycle_project/utils/colors.dart';

// Define a data class for the image data
class ImageData {
  final String imagePath;
  final String name;

  ImageData({
    required this.imagePath,
    required this.name,
  });
}

class ListViewRecommendations extends StatefulWidget {
  const ListViewRecommendations({Key? key}) : super(key: key);

  @override
  _ListViewRecommendationsState createState() => _ListViewRecommendationsState();
}

class _ListViewRecommendationsState extends State<ListViewRecommendations> {
  Set<int> selectedIndices = Set<int>(); // To track selected items

  @override
  Widget build(BuildContext context) {
    // Define a list of ImageData objects
    List<ImageData> imageDataList = [
      ImageData(
        imagePath: "images/accessories.png",
        name: "Acessórios",
      ),
      ImageData(
        imagePath: "images/clothes.png",
        name: "Roupas",
      ),
      ImageData(
        imagePath: "images/shoes.png",
        name: "Sapatos",
      ),
      ImageData(
        imagePath: "images/bags.png",
        name: "Bolsas",
      ),
      ImageData(
        imagePath: "images/furniture.png",
        name: "Móveis",
      ),
      ImageData(
        imagePath: "images/crafts.png",
        name: "Artesanato",
      ),
      ImageData(
        imagePath: "images/toys.png",
        name: "Brinquedos",
      ),
      ImageData(
        imagePath: "images/utensils.png",
        name: "Utensílios",
      ),
      ImageData(
        imagePath: "images/decoration.png",
        name: "Decoração",
      ),
      // add more images here...
    ];

    return Scaffold(
      appBar: AppBar(
        title: Flexible(
          child: Text(
            'O que mais te interessa para comprar?',
            maxLines: 2, // Allow the text to break into two lines
            overflow: TextOverflow.ellipsis,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: imageDataList.length, // Set the number of items in the list
              separatorBuilder: (BuildContext context, int index) => const Divider(), // Add a divider between each item in the list
              itemBuilder: (BuildContext context, int index) {
                final imageData = imageDataList[index]; // Get the ImageData object at the current index
                final isSelected = selectedIndices.contains(index); // Check if the item is selected
                return Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding around each ListTile
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                      child: Stack(
                        children: [
                          Image.asset(
                            imageData.imagePath,
                            width: 70, // Set the desired width
                            height: 70, // Set the desired height
                            fit: BoxFit.cover, // Ensure the image covers the specified dimensions
                          ),
                          if (isSelected)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white, // White background for the check mark
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green, // Green border
                                    width: 2, // Border width
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0), // Padding around the check mark
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.green, // Solid green check mark
                                    size: 24, // Size of the check mark icon
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ), // Display the image on the left side of the ListTile
                    title: Text(
                      imageData.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18, // Increase the font size
                      ),
                    ), // Display the name as the title of the ListTile
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndices.remove(index); // Deselect the item
                        } else {
                          selectedIndices.add(index); // Select the item
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 200, // Set a fixed width for the button
              padding: const EdgeInsets.symmetric(vertical: 14), // Adjust the vertical padding
              decoration: BoxDecoration(
                color: buttonColor, // Replace with your buttonColor
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  // Add your button functionality here
                  print("Button tapped");
                },
                child: Center(
                  child: Text(
                    'Confirmar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
