import 'package:flutter/material.dart';
import 'sceaux.dart'; 




class flag extends StatelessWidget {
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
                  'assets/images/flag.png', // Utilisez la même image si nécessaire
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
                  style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
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
            child: GestureDetector(
              onTap: () {
                  
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => sceau()),
               );
              },
              child: Image.asset(
                'assets/images/c3.png', // Changez par le chemin de votre image cliquable
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
