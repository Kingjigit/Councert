import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Positioned row at the top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/icon.png', width: 40, height: 40),
                    SizedBox(width: 8), // Spacing between icon and text
                    Text(
                      'Home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold, // Bold text
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/images/bell.png', width: 40, height: 40), // Image 1
                    SizedBox(width: 8),
                    Image.asset('assets/images/icon.png', width: 40, height: 40), // Image 2
                  ],
                ),
              ],
            ),
          ),
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Rechercher...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  borderSide: BorderSide.none, // No border
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color if needed
              ),
            ),
          ),
          // Image containers
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Two containers per row
              children: [
                buildImageContainer('assets/images/doc.png', Colors.blue, Icons.edit, 'Birth Certificate n°..'),
                buildImageContainer('assets/images/doc.png', Colors.green, Icons.edit, 'Birth Certificate n°..'),
                buildImageContainer('assets/images/doc.png', Colors.red, Icons.edit, 'Birth Certificate n°..'),
                buildImageContainer('assets/images/doc.png', Colors.orange, Icons.edit, 'Birth Certificate n°..'),
                buildImageContainer('assets/images/doc.png', Color.fromARGB(255, 47, 221, 177), Icons.edit, 'Birth Certificate n°..'),
                buildImageContainer('assets/images/doc.png', Colors.purple, Icons.edit, 'Birth Certificate n°..'),
                buildImageContainer('assets/images/doc.png', Color.fromARGB(255, 18, 202, 12), Icons.edit, 'Birth Certificate n°..'),
                buildImageContainer('assets/images/doc.png', const Color.fromARGB(255, 255, 81, 0), Icons.edit, 'Birth Certificate n°..'),
              ],
            ),
          ),
          // Action buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action for "View All"
                  },
                  child: Text('View All'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action for "Share"
                  },
                  child: Text('Share'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action for "Download"
                  },
                  child: Text('Download'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageContainer(String imagePath, Color color, IconData icon, String label) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color, // Change the background color
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0), // Specific rounded corners
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Use this for rounded corners
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 100, // Fixed height for the image
              width: 100, // Fixed width for the image
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left, // Align the text to the left
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
