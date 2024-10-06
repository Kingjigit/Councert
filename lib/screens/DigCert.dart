
import 'package:flutter/material.dart';
import 'Camdig.dart'; 

class DigCert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                // Action à effectuer lors du clic sur l'image de la caméra
                print("Camera image clicked");
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 200), // Décalage vers le haut
                child: Image.asset(
                  'assets/images/cam.png',
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
                // Action à effectuer pour le bouton
                Navigator.pop(context);
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.black), // Texte en noir
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
                  "Digital Certificate Generator",
                  style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "With our intelligent agent, easily find locally-made products and support Cameroonian producers",
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
            child: GestureDetector(
              onTap: () {
                // Redirection vers la page Camdig
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Camdig()), // Ajoutez cette ligne
                );
              },
              child: Image.asset(
                'assets/images/c1.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// N'oubliez pas d'importer la page Camdig en haut de ce fichier
// Assurez-vous que ce chemin est correct
