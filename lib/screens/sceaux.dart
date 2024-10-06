import 'package:flutter/material.dart';
import 'flag.dart';
import 'SignInPage.dart';
import 'LoginPage.dart';

class sceau extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                print("Camera image clicked");
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 200),
                child: Image.asset(
                  'assets/images/sceau.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cameroon's Digital Certificate\n App: Quick & Easy!",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "Add your products to our marketplace and reach new customers all over Cameroon",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(height: 16), // Espace entre l'image et les boutons
                Container(
                  width: double.infinity, // Prendre toute la largeur
                  child: ElevatedButton(
                    onPressed: () {
                      // Naviguer vers la page de création de compte
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    child: Text("Create"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: Color(0xFF007A5E), // Couleur du texte blanche
                    ),
                  ),
                ),
                SizedBox(height: 10), // Espace entre les boutons
                Container(
                  width: double.infinity, // Prendre toute la largeur
                  child: ElevatedButton(
                    onPressed: () {
                      // Naviguer vers la page de connexion
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF007A5E), 
                      backgroundColor: Colors.white, // Couleur du texte verte
                      side: BorderSide(color: Color(0xFF007A5E)), // Contours verts
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
