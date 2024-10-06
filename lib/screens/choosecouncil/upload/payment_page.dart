import 'package:councert/screens/choosecouncil/upload/document_upload_list.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = 'Orange Money';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            // Orange Money option
            _buildPaymentOption(
              context,
              title: 'Orange Money',
              price: '1500 XAF',
              image: 'assets/images/orange_money.jpg', // Replace with your asset image
              selected: selectedPaymentMethod == 'Orange Money',
              onSelect: () {
                setState(() {
                  selectedPaymentMethod = 'Orange Money';
                });
              },
            ),
            SizedBox(height: 30),
            // Mobile Money option
            _buildPaymentOption(
              context,
              title: 'Mobile Money',
              price: '1500 XAF',
              image: 'assets/images/mobile_money.jpg', // Replace with your asset image
              selected: selectedPaymentMethod == 'Mobile Money',
              onSelect: () {
                setState(() {
                  selectedPaymentMethod = 'Mobile Money';
                });
              },
            ),
            SizedBox(height: 40),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 40),
            // Mobile number input
            _buildMobileNumberInput(),
            SizedBox(height: 30),
            // Amount input
            _buildAmountInput(),
            Spacer(),
            // Proceed button
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  _showPaymentConfirmationDialog(context); // Trigger the confirmation dialog
                },
                child: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for payment option
  Widget _buildPaymentOption(
    BuildContext context, {
    required String title,
    required String price,
    required String image,
    required bool selected,
    required VoidCallback onSelect,
  }) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.green.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? Colors.green : Colors.grey.shade300,
            width: 2,
          ),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Payment option logo
                Image.asset(
                  image,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      price,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            if (selected)
              Icon(Icons.check_circle, color: Colors.green, size: 24),
          ],
        ),
      ),
    );
  }

  // Widget for mobile number input
  Widget _buildMobileNumberInput() {
    return Row(
      children: [
        // Country flag dropdown (for demonstration purpose, it's just a container here)
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Text('🇨🇲'),
              SizedBox(width: 5),
              Text('+237'),
              Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Your mobile number',
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }

  // Widget for amount input
  Widget _buildAmountInput() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Amount',
        suffixText: 'FCFA',
      ),
      keyboardType: TextInputType.number,
    );
  }

  // Function to show the payment confirmation dialog
  void _showPaymentConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, size: 80, color: Colors.green),
                SizedBox(height: 20),
                Text(
                  'Confirm your payment',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Please pay only at the end of your paiement. '
                  'We will not ask for additional fees except for the amount below.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 20),
                Text(
                  'Amount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '1500 FCFA',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 20),
                Text(
                  'Is this your details paiement?',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 5),
                Text(
                  'Your Orange Money account number is: +237 653 51 38 94',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); 
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DocumentUploadListPage()),
                      );// Close the dialog
                  },
                  child: Text(
                    'Confirmation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
