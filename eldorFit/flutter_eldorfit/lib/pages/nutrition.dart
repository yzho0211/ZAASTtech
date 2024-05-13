import 'package:flutter/material.dart';
import '../widgets/backgroundcont.dart'; // Ensure this custom widget is correctly implemented in your project

class NutritionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Nutrition'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Nutrition',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19297C),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildNutritionButton(
                context,
                'Meal Planner',
                'Plan your meals with our easy to use meal planner',
                () {
                  Navigator.pushNamed(context, '/mealpl_p1');
                },
              ),
              _buildNutritionButton(
                context,
                'Daily Calorie Intake',
                'Calculate your daily calorie needs',
                () {
                  Navigator.pushNamed(context, '/health_p1');
                },
              ),
              _buildNutritionButton(
                context,
                'View Statistics',
                'View dietary statistics and guidelines',
                () {
                  Navigator.pushNamed(context, '/health_p1');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutritionButton(
    BuildContext context,
    String buttonText,
    String buttonTitle,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: Column(
        children: [
          Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF19297C),
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 28,
                color: Color(0xFFFEE440),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 25, 42, 124),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
