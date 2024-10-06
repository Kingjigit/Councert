import 'package:councert/screens/Docs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Edit button functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF009688), // Dark Green background color
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 20,),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/icon.png'), // Placeholder image
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Ngufor Faith Jr',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Teacher',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Douala',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              '+2378689999',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),

            // Certificate Progress Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Certificate Progress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // View all certificates action
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DocumentScreen()));
                    },
                    child: Text(
                      'View all', 
                      style: TextStyle(color: Color(0xFF009688)),
                      ),
                  ),
                ],
              ),
            ),

            // Progress Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: Color(0xFFE0F7FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.article_outlined, color: Color(0xFF009688)),
                              SizedBox(width: 10),
                              Text(
                                'Marriage Certificate',
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.more_vert),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Progress Bar
                      LinearProgressIndicator(
                        value: 0.8, // 80% progress
                        backgroundColor: Colors.white,
                        color: Color(0xFF26C6DA), // Progress color
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text('80%'),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            SizedBox(height: 20,),
            // My Certificates Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Certificates',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Verified and Unverified Certificates
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.verified, color: Color(0xFF009688)),
                    title: Text('Verified'),
                    subtitle: Text('View all your verified certificates here'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DocumentScreen()));
                      // View verified certificates
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.cancel, color: Colors.red),
                    title: Text('Unverified'),
                    subtitle:
                        Text('View all your unverified certificates here'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DocumentScreen()));
                      // View unverified certificates
                    },
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
