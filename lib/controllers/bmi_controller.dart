import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller class for managing BMI calculation.
class BMIController extends GetxController {
  /// Text editing controller for input field of height.
  TextEditingController heightController = TextEditingController();

  /// Text editing controller for input field of weight.
  TextEditingController weightController = TextEditingController();

  /// Observed variable to store the calculated BMI result.
  RxDouble bmiResult = 0.0.obs;

  /// Method to calculate BMI interpretation.
  ///
  /// This method calculates the BMI interpretation based on the entered height and weight.
  void getBMIInterpretation() {}
}
