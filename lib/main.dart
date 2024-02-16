import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/bmi_controller.dart';
import 'screens/calculate_screen.dart';
import 'screens/info_screen.dart';

void main() {
  runApp(MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  final BMIController bmiController = BMIController();

  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'The Body Balance', // AppBar title
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor:
                Color.fromARGB(255, 24, 16, 58), // AppBar background color
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.calculate, // Calculate tab icon
                    color: Colors.white,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.info, // Info tab icon
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'assets/final 1.jpeg', // Background image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              TabBarView(
                children: [
                  CalculateScreen(), // Calculate screen
                  InfoScreen(
                      bmiController:
                          bmiController), // Info screen with BMI controller
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
