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
                'View Statistics',
                'View dietary statistics and guidelines',
                () {
                  Navigator.pushNamed(context, '/diet_trend');
                },
              ),
              _buildNutritionButton(
                context,
                'Daily Calorie Intake',
                'Calculate your daily calorie needs',
                () {
                  Navigator.pushNamed(context, '/calculate');
                },
              ),
              _buildNutritionButton(
                context,
                'Meal Planner',
                'Plan your meals with our easy to use meal planner',
                () {
                  Navigator.pushNamed(context, '/mealpl_p1');
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.deepPurple),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
