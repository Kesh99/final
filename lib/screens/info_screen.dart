import 'package:flutter/material.dart';
import '../controllers/bmi_controller.dart';

/// Screen for displaying BMI information.
class InfoScreen extends StatelessWidget {
  final BMIController bmiController;

  InfoScreen({required this.bmiController});

  /// Determine the BMI category based on the  BMI value.
  String getCategory(double bmi) {
    if (bmi < 16) {
      return 'Severe undernourishment';
    } else if (bmi >= 16 && bmi < 17) {
      return 'Medium undernourishment';
    } else if (bmi >= 17 && bmi < 18.5) {
      return 'Slight undernourishment';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal nutrition state';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else if (bmi >= 30 && bmi < 40) {
      return 'Obesity';
    } else {
      return 'Pathological obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(255, 24, 16, 58), // Custom app bar background color
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigate back when the icon is pressed
          },
        ),
        title: Text(
          'The Body Balance', // AppBar title
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/final 1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your BMI: ${bmiController.bmiResult.value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Interpretation: ${getCategory(bmiController.bmiResult.value)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 8, 8, 8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
