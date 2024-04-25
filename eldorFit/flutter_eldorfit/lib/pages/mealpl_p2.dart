import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealPlanPage2 extends StatefulWidget {
  final String targetCalories;
  final String diet;

  const MealPlanPage2({
    Key? key,
    required this.targetCalories,
    required this.diet,
  }) : super(key: key);

  @override
  _MealPlanPage2State createState() => _MealPlanPage2State();
}

class _MealPlanPage2State extends State<MealPlanPage2> {
  Map<String, dynamic> mealPlan = {};
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    generateMealPlan();
  }

  Future<void> generateMealPlan() async {
    try {
      String queryParams =
          'apiKey=0612c41b08594352aa13d31e8273cbf8&timeFrame=week&targetCalories=${widget.targetCalories}&diet=${widget.diet}';

      var response = await http.get(Uri.parse(
          'https://api.spoonacular.com/mealplanner/generate?$queryParams'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          mealPlan = Map<String, dynamic>.from(data['week']);
        });
      } else {
        setState(() {
          errorMessage = 'API call failed: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Network connection error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Plan Result'),
      ),
      body: errorMessage.isNotEmpty
          ? Center(
              child: Text(
                errorMessage,
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
            )
          : mealPlan.isEmpty
              ? const Center(
                  child: Text(
                    'No meal data found for the week',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : ListView.builder(
                  itemCount: mealPlan.length,
                  itemBuilder: (context, index) {
                    var dayKey = mealPlan.keys.toList()[index];
                    var dayPlan = mealPlan[dayKey];
                    return _buildDayCard(dayKey, dayPlan);
                  },
                ),
    );
  }

  Widget _buildDayCard(String dayKey, dynamic dayPlan) {
    // Create a card with blue background for each day
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blue, // Blue background color for the card
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dayKey.toUpperCase(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          _buildMealDetail('Breakfast', dayPlan['meals'][0]['title']),
          _buildMealDetail('Lunch', dayPlan['meals'][1]['title']),
          _buildMealDetail('Dinner', dayPlan['meals'][2]['title']),
          _buildNutrientInfo(dayPlan['nutrients']),
        ],
      ),
    );
  }

  Widget _buildMealDetail(String mealName, String mealTitle) {
    // Display meal details with larger font and more space between meals
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Increase spacing
      child: Text(
        '$mealName: $mealTitle',
        style: const TextStyle(
          fontSize: 22, // Larger font size
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildNutrientInfo(Map<String, dynamic> nutrients) {
    // Display nutrients information with each nutrient on a separate line
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0), // Increase spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nutrition:',
            style: const TextStyle(
              fontSize: 20, // Larger font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text('Calories: ${nutrients['calories']}',
              style: const TextStyle(
                  fontSize: 20, color: Colors.white)), // Larger font size
          Text('Protein: ${nutrients['protein']}',
              style: const TextStyle(
                  fontSize: 20, color: Colors.white)), // Larger font size
          Text('Fat: ${nutrients['fat']}',
              style: const TextStyle(
                  fontSize: 20, color: Colors.white)), // Larger font size
          Text('Carbs: ${nutrients['carbohydrates']}',
              style: const TextStyle(
                  fontSize: 20, color: Colors.white)), // Larger font size
        ],
      ),
    );
  }
}
