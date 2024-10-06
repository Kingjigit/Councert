import 'package:councert/screens/choosecouncil/upload/done_payment.dart';
import 'package:councert/screens/choosecouncil/upload/payment_page.dart';
import 'package:councert/screens/form/birth_certificate_form.dart';
import 'package:flutter/material.dart';

class DocumentUploadListPage extends StatefulWidget {
  const DocumentUploadListPage({super.key});

  @override
  State<DocumentUploadListPage> createState() => _DocumentUploadListPageState();
}

class _DocumentUploadListPageState extends State<DocumentUploadListPage> {

   List<Map<String, dynamic>> fileList = [
    {"name": "Doc_1.pdf", "type": "Payslip"},
    {"name": "Doc_2.pdf", "type": "Payslip"},
    {"name": "Doc_3.pdf", "type": "Payslip"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Upload Documents", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ), textAlign: TextAlign.center),
            SizedBox(height: 15,),
            Text(
              'The Tchôbi spice comes from West Africa. The Tchôbi spice is '
              'used in many famous dishes. The Tchôbi spice is known worldwide.',
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 20),
            _buildFileList(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
              },
              child: Text("Submit My Files", style: TextStyle(color: Colors.white, fontSize: 20),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF009688),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              ),
            ),
            SizedBox(height: 150,),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: FloatingActionButton(
                backgroundColor: Color(0xFF009688),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonePayment()),
                  );
                },
                child: Icon(Icons.arrow_forward, color: Colors.white,),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileList() {
    return Column(
      children: fileList.map((file) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Card(
            elevation: 1,
            child: ListTile(
              title: Text(file['name']),
              subtitle: SizedBox(
                width: 50,  // Adjust the width as needed
                child: DropdownButton<String>(
                  value: file['type'],
                  isExpanded: true,  // Makes sure text wraps within the limited width
                  onChanged: (String? newValue) {
                    setState(() {
                      file['type'] = newValue!;
                    });
                  },
                  items: <String>['Payslip', 'ID Card', 'Contract']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              trailing: Wrap(
                spacing: 10,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_red_eye, color: Colors.black38),
                    onPressed: () {
                      // Preview functionality
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Color(0xFF009688)),
                    onPressed: () {
                      setState(() {
                        fileList.remove(file);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}