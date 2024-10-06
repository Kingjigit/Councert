import 'package:councert/screens/DigCert.dart';
import 'package:councert/screens/Docs.dart';
import 'package:councert/screens/Home.dart';
import 'package:councert/screens/ProfilePage.dart';
import 'package:councert/screens/cert.dart';
import 'package:councert/screens/choosecouncil/choose_council.dart';
import 'package:councert/screens/form/birth_certificate_form.dart';
import 'package:councert/screens/ouv.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My New App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DigCert(), // Changed from HomePage to OuvPage
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My New App'),
      ),
      body: Column(
        children: [
           ElevatedButton(
          onPressed: () {
            // Navigate to BirthCertificateForm when button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BirthCertificateForm()),
            );
          },
          child: Text('Go to Form'),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to BirthCertificateForm when button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChooseCouncilPage()),
            );
          },
          child: Text('Go to Council page'),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to BirthCertificateForm when button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          child: Text('Go to Profile page'),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to BirthCertificateForm when button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DocumentScreen()),
            );
          },
          child: Text('Go to Document page'),
        ),
        ],
      ),
    );   
  }
}
