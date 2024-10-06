import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: DocumentScreen(),
  ));
}

class DocumentScreen extends StatefulWidget {
  @override
  _DocumentScreenState createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  // Sample data list for documents
  List<String> documents = [
    'my certificate.pdf',
    'my certificate.pdf',
    'my certificate.pdf',
    'my certificate.pdf',
    'my certificate.pdf',
  ];

  // Function to delete a document
  void _deleteDocument(int index) {
    setState(() {
      documents.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF009688)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Document',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Color(0xFF009688)),
                  ],
                ),
              ),
            ),
            
            // Document Section Header
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Document',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            
            // List of Documents
            Expanded(
              child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20.0),
                        color: Colors.red,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        _deleteDocument(index); // Delete the item when swiped
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.grey),
                        ),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.filePdf,  // PDF icon
                            size: 40,
                            color: Color(0xFF009688),  // You can change the color as needed
                          ),
                          title: Text(documents[index]),
                          subtitle: Text('1.6 MB'),
                          trailing: Icon(Icons.more_vert),
                          onTap: () {
                            // Action for tapping the document item
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
