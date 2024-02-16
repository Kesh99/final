import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bmi_controller.dart';
import 'info_screen.dart';

/// Screen for calculating BMI.
class CalculateScreen extends StatelessWidget {
  final BMIController bmiController = BMIController();

  CalculateScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: bmiController.heightController,
            keyboardType: TextInputType.number,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              labelText: 'Height (m)', // Label for height input field
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 8, 8, 8), // Label text color
                fontWeight: FontWeight.bold, // Bold label text
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(1, 1, 1, 1)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: bmiController.weightController,
            keyboardType: TextInputType.number,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              labelText: 'Weight (kg)', // Label for weight input field
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 10, 10, 10), // Label text color
                fontWeight: FontWeight.bold, // Bold label text
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              try {
                double height =
                    double.parse(bmiController.heightController.text);
                double weight =
                    double.parse(bmiController.weightController.text);
                double bmi = weight / (height * height);
                bmiController.bmiResult.value = bmi;
                Get.to(() => InfoScreen(
                    bmiController: bmiController)); // Navigate to InfoScreen
              } catch (e) {
                print('Error: $e'); // Print error message
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 13, 4, 87),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Center(
              child: Text(
                'Calculate', // Button text
                style: TextStyle(
                  color: Color.fromARGB(255, 247, 247, 248),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => Text(
              'BMI: ${bmiController.bmiResult.value.toStringAsFixed(2)}', // Display calculated BMI
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Developed by Keshika', // Developer info
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
