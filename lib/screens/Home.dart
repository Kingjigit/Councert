import 'package:councert/screens/ProfilePage.dart';
import 'package:councert/screens/choosecouncil/choose_council.dart';
import 'package:flutter/material.dart';
// Assurez-vous d'importer cert.dart si nécessaire
// import 'cert.dart'; // Décommentez si vous avez défini cette classe dans un autre fichier
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Positioned row at the top
          SizedBox(height: 50),

          // Title for popular certificates
          Text(
            'Hi Customer',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          // Search bar
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Rechercher...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          // Subtitle after search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Certificates',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    // Action for navigating to 'View All' page
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 169, 176, 182),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          // Image containers
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                // Birth Certificate with navigation
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseCouncilPage()), // Passez le nom
                    );
                  },
                  child: buildImageContainer('assets/images/doc.png', Colors.blue, Icons.edit, 'Birth Certificate'),
                ),
                buildImageContainer('assets/images/doc.png', Colors.green, Icons.edit, 'Marriage Certificate'),
                buildImageContainer('assets/images/doc.png', Colors.red, Icons.edit, 'Death Certificate'),
                // Adding 4 additional containers
                buildImageContainer('assets/images/doc.png', Colors.purple, Icons.edit, 'Divorce Certificate'),
                buildImageContainer('assets/images/doc.png', Colors.teal, Icons.edit, 'Adoption Certificate'),
                buildImageContainer('assets/images/doc.png', Colors.orange, Icons.edit, 'Residence Certificate'),

              ],
            ),
          ),

          // Add Bottom Navigation Bar
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 24),  // Home icon,
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back, size: 24),  // Back arrow icon,
                label: 'Retour',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.refresh, size: 24),  // Refresh icon,
                label: 'Rafraîchir',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 24),  // About/info icon
                label: 'À propos',
              ),
            ],
            currentIndex: 0, // Indicate the currently selected index
            selectedItemColor: Color(0xFF009688), // Change selection color
            unselectedItemColor: Colors.black54, // Color for unselected items
            onTap: (index) {
              // Handle icon taps
              switch (index) {
                case 0:
                  // Action for Home
                  break;
                case 1:
                  // Action for Retour
                  break;
                case 2:
                  // Action for Rafraîchir
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}

      

  Widget buildImageContainer(String imagePath, Color color, IconData icon, String label) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ), 
          ),
                    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                        label,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 2, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(
                      icon,
                      color: Colors.blue,
                      size: 30,
                    ),
                )
              )
            ],
          )
    );
  }


// Assurez-vous de définir CertPage comme dans l'exemple précédent
class CertPage extends StatelessWidget {
  final String certificateName;

  CertPage({Key? key, required this.certificateName}) : super(key: key);

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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Retour à la page précédente
                  },
                  child: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 8),
                Text(
                  'Back',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                
              ],
            ),
          ),
           SizedBox(height: 10),

          // Title for popular certificates
          Text(
            'View all',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Certificate...',
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
                buildImageContainer('assets/images/doc.png', Colors.blue, Icons.edit, 'Birth Certificate n°...'),
                buildImageContainer('assets/images/doc.png', Colors.green, Icons.edit, 'Birth Certificate n°...'),
                buildImageContainer('assets/images/doc.png', Colors.red, Icons.edit, 'Birth Certificate n°...'),
                buildImageContainer('assets/images/doc.png', Colors.orange, Icons.edit, 'Birth Certificate n°...'),
                buildImageContainer('assets/images/doc.png', Colors.purple, Icons.edit, 'Birth Certificate n°...'),
                buildImageContainer('assets/images/doc.png', Color.fromARGB(255, 47, 221, 177), Icons.edit, 'Birth Certificate n°...'),
                buildImageContainer('assets/images/doc.png', Color.fromARGB(255, 18, 202, 12), Icons.edit, 'Birth Certificate n°...'),
                buildImageContainer('assets/images/doc.png', const Color.fromARGB(255, 255, 81, 0), Icons.edit, 'Birth Certificate n°...'),
              ],
            ),
          ),
          // Action buttons
          
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
