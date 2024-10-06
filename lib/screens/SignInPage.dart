import 'package:flutter/material.dart';
import 'LoginPage.dart';



class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true;  // Pour gérer la visibilité du mot de passe
  bool _obscureConfirmPassword = true; // Pour le champ de confirmation
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _passwordError; // Pour stocker les messages d'erreur

  // Fonction pour valider le mot de passe
  bool _validatePassword(String password) {
    final bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    final bool hasLowerCase = password.contains(RegExp(r'[a-z]'));
    final bool hasDigits = password.contains(RegExp(r'[0-9]'));
    final bool hasSpecialCharacters = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasUpperCase && hasLowerCase && hasDigits && hasSpecialCharacters;
  }

  void _onCreateAccount() {
    // Validation
    if (!_validatePassword(_passwordController.text)) {
      setState(() {
        _passwordError = "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
      });
    } else if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _passwordError = "Passwords do not match.";
      });
    } else {
      setState(() {
        _passwordError = null; // Aucun message d'erreur
      });
      // Process of account creation
      // Utiliser votre logique ici pour créer le compte
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row pour l'icône de retour et le texte "Back"
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
            SizedBox(height: 40),
            // Section centrée contenant Email jusqu'à Create Account
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
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
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
                  if (_passwordError != null) // Afficher message d'erreur
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _passwordError!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  SizedBox(height: 20),
                  // Champ Confirmer le mot de passe
                  Text("Confirm Password", style: TextStyle(fontSize: 16)),
                  TextField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "Confirm your password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscureConfirmPassword,
                  ),
                  SizedBox(height: 20),
                  // Bouton Create Account
                  ElevatedButton(
                    onPressed: _onCreateAccount,
                    child: Text("Create Account"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: Color(0xFF007A5E), // Couleur du texte
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // Arrondi du bouton
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Bouton Sign Up
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>LoginPage()), // Redirection vers SignInPage
                      );
                    },
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF007A5E), // Texte vert
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
