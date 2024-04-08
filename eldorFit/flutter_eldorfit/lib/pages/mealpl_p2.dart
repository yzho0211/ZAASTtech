import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealPlanPage2 extends StatefulWidget {
  final String targetCalories;
  final String diet;
  final String exclude;

  const MealPlanPage2({
    Key? key,
    required this.targetCalories,
    required this.diet,
    required this.exclude,
  }) : super(key: key);

  @override
  _MealPlanPage2State createState() => _MealPlanPage2State();
}

class _MealPlanPage2State extends State<MealPlanPage2> {
  List<Map<String, dynamic>> mealPlan = []; // Initialize meal plan list

  @override
  void initState() {
    super.initState();
    generateMealPlan();
  }

  Future<void> generateMealPlan() async {
    // Make API request to generate meal plan with parameters
    var response = await http.get(Uri.parse(
        'https://api.spoonacular.com/mealplanner/generate?apiKey=b4757d256a764b2bbcad36698241424c&timeFrame=week&targetCalories=${widget.targetCalories}&diet=${widget.diet}&exclude=${widget.exclude}'));

    if (response.statusCode == 200) {
      // Meal plan generated successfully, handle response data
      var data = jsonDecode(response.body);
      setState(() {
        if (data['week']['meals'] != null) {
          setState(() {
            mealPlan = List<Map<String, dynamic>>.from(data['week']['meals']);
          });
        } else {
          // Handle the case where meals data is null
          print('Meal data is null');
        }
      });
    } else {
      // Failed to generate meal plan, handle error
      print('Failed to generate meal plan: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Plan Result'),
      ),
      body: ListView.builder(
        itemCount: mealPlan.length,
        itemBuilder: (context, index) {
          var meal = mealPlan[index];
          return ListTile(
            title: Text('Day ${index + 1} - ${meal['title']}'),
            subtitle: Text('Nutrients: ${meal['nutrients']}'),
          );
        },
      ),
    );
  }
}