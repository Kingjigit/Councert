import 'package:councert/screens/choosecouncil/upload/compose_code.dart';
import 'package:councert/screens/choosecouncil/upload/document_upload_list.dart';
import 'package:councert/screens/choosecouncil/upload/payment_page.dart';
import 'package:flutter/material.dart';

class UploadDocumentsPage extends StatefulWidget {
  const UploadDocumentsPage({super.key});

  @override
  State<UploadDocumentsPage> createState() => _UploadDocumentsPageState();
}

class _UploadDocumentsPageState extends State<UploadDocumentsPage> {
  List<Map<String, dynamic>> uploadedFiles = [
    {"name": "Nationality certificate.pdf", "progress": 0.64},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text("Upload Your Supporting Documents", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  color: Color(0xFF009688),
                  child: const Icon(
                    Icons.upload_sharp, color: Colors.white,
                  )
                ),
                SizedBox(width: 15,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1st option: Simply Upload your documents below\n'
                      '2nd option: Deposit and stamp your documents at council',
                      style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ],
                )

              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ComposeCode()),
                );
              },
              child: Text("Stamp Payment", style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF009688),
                padding: EdgeInsets.only(left: 20, right: 20)
              ),
            ),
            SizedBox(height: 30),
            _buildFileUploadSection(),
            SizedBox(height: 40),
            Text("Uploaded files", style: TextStyle(color: Colors.black54, fontSize: 20),), 
            SizedBox(height: 10),
            _buildUploadedFilesList(),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentUploadListPage()),
                );
              },
              child: Text("Done", style: TextStyle(color: Colors.white, fontSize: 20),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF009688),
                padding: EdgeInsets.only(left: 30, right: 30,top: 10, bottom: 10),
                alignment: Alignment.bottomRight
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileUploadSection() {
    return Container(
      padding: EdgeInsets.only(left: 100, right: 100, top: 30, bottom: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            "Upload Files here",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          Icon(Icons.cloud_upload, size: 90, color: Color(0xFF009688)),
          SizedBox(height: 10),
          Text(
            "Drop & Drag your files here\nOR",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement browse file functionality
            },
            child: Text("Browse files", style: TextStyle(color: Colors.white, fontSize: 19),),
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF009688)),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadedFilesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: uploadedFiles.map((file) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Card(
            elevation: 1,
            child: ListTile(
              leading: Icon(Icons.description, color: Color(0xFF009688)),
              title: Text(file['name']),
              subtitle: LinearProgressIndicator(
                value: file['progress'],
                color: Color(0xFF009688),
                backgroundColor: Colors.grey.shade300,
              ),
              trailing: IconButton(
                icon: Icon(Icons.close, color: Color(0xFF009688)),
                onPressed: () {
                  setState(() {
                    uploadedFiles.remove(file);
                  });
                },
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}