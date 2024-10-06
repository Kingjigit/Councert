import 'dart:async';
import 'package:flutter/material.dart';
import 'DigCert.dart';  // Assurez-vous d'importer DigCert ici

class OuvPage extends StatefulWidget {
  @override
  _OuvPageState createState() => _OuvPageState();
}

class _OuvPageState extends State<OuvPage> {
  @override
  void initState() {
    super.initState();
    // Démarrer un timer pour basculer après 5 secondes
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DigCert()), // Mettre à jour ici
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/councert.png',  // Assurez-vous d'avoir correctement déclaré cette image
          fit: BoxFit.contain,  // Utilisez BoxFit.contain pour garder l'image entière
          width: 300,  // Ajustez la largeur selon vos besoins
          height: 300, // Ajustez la hauteur selon vos besoins
        ),
      ),
    );
  }
}
