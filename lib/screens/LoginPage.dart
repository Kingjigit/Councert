import 'package:flutter/material.dart';
import 'Home.dart';
import 'SignInPage.dart'; // Assurez-vous que ce fichier existe et contient la page Sign In.

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true; // Pour gérer la visibilité du mot de passe

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row pour l'icône de retour et le texte "Back"
            SizedBox(height: 30,),
            Row(
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
            SizedBox(height: 150),
            // Section centrée contenant Email jusqu'à Sign Up
            Center(
              child: Column(
                children: [
                  // Champ Email
                  Text("Email", style: TextStyle(fontSize: 16)),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "Enter your email",
                    ),
                  ),
                  SizedBox(height: 20),
                  // Champ Mot de passe
                  Text("Password", style: TextStyle(fontSize: 16)),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  SizedBox(height: 20),
                  // Bouton Login
                  ElevatedButton(
                    onPressed: () {
                      // Redirection vers la page Home
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: Color(0xFF007A5E), // Couleur du texte
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // Arrondi du bouton
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()), // Redirection vers SignInPage
                      );
                    },
                    child: Text(
                      "Forgot password? Modify here",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 68, 255, 68), // Texte vert
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Bouton Sign Up
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()), // Redirection vers SignInPage
                      );
                    },
                    child: Text(
                      "Do you want to have an account? Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 68, 255, 68), // Texte vert
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
