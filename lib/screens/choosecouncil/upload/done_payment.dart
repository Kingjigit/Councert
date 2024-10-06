import 'package:councert/screens/form/birth_certificate_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonePayment extends StatelessWidget {
  const DonePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 120,),
          FaIcon( FontAwesomeIcons.moneyCheckDollar, size: 160, color: Color(0xFF009688),),
          SizedBox(height: 20,),
          Center(
            child: Text("Congratulations", style: TextStyle(fontSize: 35),),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("We are in partnership with the Operators. To pay us, please enter the following code and validate.",
          style: TextStyle(fontSize: 15, color: Colors.black54), textAlign: TextAlign.center,),
          ),
          SizedBox(height: 260,),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: FloatingActionButton(
                backgroundColor: Color(0xFF009688),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BirthCertificateForm()),
                  );
                },
                child: Icon(Icons.arrow_forward, color: Colors.white,),
              ),
              ),
            ),
        ],
      ),
    );
  }
}