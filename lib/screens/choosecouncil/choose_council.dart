import 'package:councert/screens/choosecouncil/upload/compose_code.dart';
import 'package:councert/screens/choosecouncil/upload/document_upload_list.dart';
import 'package:councert/screens/choosecouncil/upload/done_payment.dart';
import 'package:councert/screens/choosecouncil/upload/payment_page.dart';
import 'package:councert/screens/choosecouncil/upload/upload_documents.dart';
import 'package:flutter/material.dart';

class ChooseCouncilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: _buildSearchBar(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildCertificateCard(),
                SizedBox(height: 20),
                _buildGetStartedButton(context),
              ],
            ),
          ),
      ],
    )
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Color(0xFF009688)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Color(0xFF009688)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Color(0xFF009688), width: 2.0),
        ),
      ),
    );
  }

  Widget _buildCertificateCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 270,
              width: 400,
              decoration: BoxDecoration(
                color: Color(0xFFBEDFDB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.article_outlined, color: Color(0xFF009688), size: 100),
                  SizedBox(height: 30),
                  Text(
                      'Birth Certificate',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                ],
              )
            ),
            SizedBox(height: 30),
            Text(
              'Documents required',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF009688),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'The Tchôbi spice comes from West Africa. '
              'The tchôbi spice is used in many famous dishes. '
              'The tchôbi spice is known worldwide.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            _buildDropdown(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Color(0xFF009688)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Color(0xFF009688)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Color(0xFF009688), width: 2.0),
        ),
      ),
      hint: Text('Choose Council'),
      items: ['Acacia', 'Efoulan', 'Etoudi']
          .map((council) => DropdownMenuItem(
                value: council,
                child: Text(council),
              ))
          .toList(),
      onChanged: (value) {},
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadDocumentsPage()),
            );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF009688),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Get Started',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward, color:Colors.white,),
        ],
      ),
    );
  }
}
