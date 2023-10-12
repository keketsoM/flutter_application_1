import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/route.dart';
import 'package:flutter_application_1/screens/widgets/BlackBottomNav.dart';
import 'package:flutter_application_1/screens/widgets/OrderSummary.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ProvinceController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Customer Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextfieldCheckout(
                nameController: nameController,
                label: 'name',
                keytype: TextInputType.name,
              ),
              TextfieldCheckout(
                nameController: emailController,
                label: 'Email',
                keytype: TextInputType.emailAddress,
              ),
              TextfieldCheckout(
                nameController: contactController,
                label: 'Contact Number',
                keytype: TextInputType.number,
              ),
              TextfieldCheckout(
                nameController: addressController,
                label: 'Address',
                keytype: TextInputType.text,
              ),
              TextfieldCheckout(
                nameController: ProvinceController,
                label: 'Province',
                keytype: TextInputType.text,
              ),
              TextfieldCheckout(
                nameController: zipCodeController,
                label: 'Postal Code',
                keytype: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Order Summary",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Order_Summary(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BlackBottomNav(
        name: 'pay Now',
        pageName: Routemanger.eightPage,
      ),
    );
  }
}

class TextfieldCheckout extends StatelessWidget {
  const TextfieldCheckout(
      {super.key,
      required this.nameController,
      required this.label,
      required this.keytype});

  final TextEditingController nameController;
  final String label;
  final TextInputType keytype;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(label),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: nameController,
                  keyboardType: keytype,
                  decoration: InputDecoration(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
