import 'package:councert/screens/choosecouncil/upload/document_upload_list.dart';
import 'package:flutter/material.dart';

class ComposeCode extends StatelessWidget {
  const ComposeCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Center(
            child: Text("Stamp Payment", style: TextStyle(fontSize: 35),),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("We are in partnership with the Operators. To pay us, please enter the following code and validate.",
          style: TextStyle(fontSize: 15, color: Colors.black54), textAlign: TextAlign.center,),
          ),
          SizedBox(height: 30,),
          Text("Code Orange Money"),
          Text("#150*404#", style: TextStyle(fontSize: 50)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16), 
            child: Divider(color: Colors.grey, thickness: 1,),
          ),
          SizedBox(height: 20,),
          Text("Or"),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(" Press the following button to dial automatically and validate with your pin code (Secret)",
          style: TextStyle(fontSize: 15, color: Colors.black54), textAlign: TextAlign.center,),
          ),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: (){
              // code to dial automatically and validate with your pin code (Secret)
            }, 
            child: Text("Compose",
            style: TextStyle(
              fontSize: 30, 
              color: Colors.white,),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF009688),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
            ),
            
          ),
          SizedBox(height: 240,),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: FloatingActionButton(
                backgroundColor: Color(0xFF009688),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DocumentUploadListPage()),
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