import 'package:flutter/material.dart';

class StepFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: BirthCertificateForm(),
    );
  }
}

class BirthCertificateForm extends StatefulWidget {
  @override
  _BirthCertificateFormState createState() => _BirthCertificateFormState();
}

class _BirthCertificateFormState extends State<BirthCertificateForm> {
  PageController _pageController = PageController();
  int _currentStep = 0;

  void _goToNextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _goToPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
  void _showPreview() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Preview Information'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Child Name: $_childName'),
              Text('Child Date of Birth: $_childDOB'),
              Text('Child Place of Birth: $_childPOB'),
              Text('Child Gender: $_gender'),
              SizedBox(height: 10),
              Text('Father Name: $_fatherName'),
              Text('Father Place of Birth: $_fatherPOB'),
              Text('Father Date of Birth: $_fatherDOB'),
              Text('Father Residence: $_fatherResidence'),
              Text('Father Nationality: $_fatherNationality'),
              Text('Father Occupation: $_fatherOccupation'),
              SizedBox(height: 10),
              Text('Mother Name: $_motherName'),
              Text('Mother Place of Birth: $_motherPOB'),
              Text('Mother Date of Birth: $_motherDOB'),
              Text('Mother Residence: $_motherResidence'),
              Text('Mother Nationality: $_motherNationality'),
              Text('Mother Occupation: $_motherOccupation'),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  InputDecoration customInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: Color(0xFF009688)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: Color(0xFF009688), width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: Color(0xFF009688), width: 2.0),
    ),
  );
}

  Widget _buildStep(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDottedLine() {
    return Expanded(
      child: Container(
        height: 2,
        color: Color(0xFF009688),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(20, (index) {
              return Container(
                width: 3,
                height: 2,
                color: Color(0xFF009688),
                margin: EdgeInsets.symmetric(horizontal: 1),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildStaticStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStep('Upload', _currentStep >= 0 ? Icons.check : Icons.circle, _currentStep >= 0 ? Color(0xFF009688) : Colors.black),
       _buildDottedLine(),
        _buildStep('Fill', _currentStep >= 1 ? Icons.check : Icons.circle, _currentStep >= 1 ? Color(0xFF009688) : Colors.black),
        _buildDottedLine(),
        _buildStep('Register', _currentStep >= 2 ? Icons.check : Icons.circle_outlined, _currentStep >= 2 ? Color(0xFF009688) : Colors.black),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Fill Certificate", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: [
          // Stepper (static) at the top
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildStaticStepper(),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 20),
            child: const Center(child: 
            Text(
              "Fill Certificate", 
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
            )
           ),
          ),
          const Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
            child: const Center(child: 
            Text(
              "Carefully and accurately fill this form with information needed", 
              style: TextStyle(
                fontSize: 15, 
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            )
           ),
          ),
          
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), // Disable swipe
              children: [
                _buildChildForm(),
                _buildFatherForm(),
                _buildMotherForm(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF009688), // Button background color // Text color
                    side: BorderSide(color: Colors.white, width: 2), // White border
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15), // Increase button size
                  ),
                    onPressed: _goToPreviousStep,
                    child: Text(
                      'Back',
                      style: TextStyle(
                       fontSize: 18, 
                       fontWeight: FontWeight.bold,
                       color: Colors.white
                    ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: _currentStep == 2 ? () { _showPreview(); } : _goToNextStep,
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF009688), // Button background color // Text color
                  side: BorderSide(color: Colors.white, width: 2), // White border
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15), // Increase button size
                ),
                  child: Text(
                    style: TextStyle(
                       fontSize: 18, 
                       fontWeight: FontWeight.bold,
                       color: Colors.white
                    ),
                    _currentStep == 2 ? 'Submit' : 'Next'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  String? _gender;
  String? _childName;
  String? _childDOB;
  String? _childPOB;

  String? _fatherName;
  String? _fatherPOB;
  String? _fatherDOB;
  String? _fatherResidence;
  String? _fatherNationality;
  String? _fatherOccupation;

  String? _motherName;
  String? _motherPOB;
  String? _motherDOB;
  String? _motherResidence;
  String? _motherNationality;
  String? _motherOccupation;

  Widget _buildChildForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Child Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: customInputDecoration('Child Name'),
            onChanged: (value) {
              _childName = value;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: customInputDecoration('Date of Birth'),
            onChanged: (value) {
              _childDOB = value;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: customInputDecoration('Place of Birth'),
            onChanged: (value) {
              _childPOB = value;
            },
          ),
          SizedBox(height: 20),
          Text('Sex:'),
        RadioListTile<String>(
          title: Text('Male'),
          value: 'Male',
          groupValue: _gender,
          onChanged: (String? value) {
            setState(() {
              _gender = value;
            });
          },
        ),
        RadioListTile<String>(
          title: Text('Female'),
          value: 'Female',
          groupValue: _gender,
          onChanged: (String? value) {
            setState(() {
              _gender = value;
            });
          },
        ),
        ],
      ),
    );
  }

  Widget _buildFatherForm() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Father Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: customInputDecoration('Father Name'),
            onChanged: (value) {
              _fatherName = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: customInputDecoration('Place of Birth'),
            onChanged: (value) {
              _fatherPOB = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: customInputDecoration('Date of Birth'),
             onChanged: (value) {
              _fatherDOB = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: customInputDecoration('Resident At'),
             onChanged: (value) {
              _fatherResidence = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: customInputDecoration('Nationality'),
             onChanged: (value) {
              _fatherNationality = value;
            },
          ),
          SizedBox(height: 7),
          TextFormField(
            decoration: customInputDecoration('Occupation'),
             onChanged: (value) {
              _fatherOccupation = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMotherForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mother Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: customInputDecoration('Mother Name'),
             onChanged: (value) {
              _motherName = value;
            },
          ),
          SizedBox(height: 5),
          TextFormField(
            decoration: customInputDecoration('Place of Birth'),
            onChanged: (value) {
              _motherPOB = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: customInputDecoration('Date of Birth'),
            onChanged: (value) {
              _motherDOB = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: customInputDecoration('Resident At'),
            onChanged: (value) {
              _motherResidence = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: customInputDecoration('Nationality'),
            onChanged: (value) {
              _motherNationality = value;
            },
          ),
          SizedBox(height: 7),
          TextFormField(
            decoration: customInputDecoration('Occupation'),
            onChanged: (value) {
              _motherOccupation = value;
            },
          ),
        ],
      ),
    );
  }
}
