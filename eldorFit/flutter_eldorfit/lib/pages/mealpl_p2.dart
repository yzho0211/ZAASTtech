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

  @override
  void initState() {
    super.initState();
    generateMealPlan();
  }

  Future<void> generateMealPlan() async {
    try {
      String queryParams =
          'apiKey=b4757d256a764b2bbcad36698241424c&timeFrame=week&targetCalories=${widget.targetCalories}&diet=${widget.diet}';

      var response = await http.get(Uri.parse(
          'https://api.spoonacular.com/mealplanner/generate?$queryParams'));

      if (response.statusCode == 200) {
        setState(() {
          mealPlan = jsonDecode(response.body)['week'];
        });
      } else {
        // Handle API error
        print('API call failed: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network connection error
      print('Network connection error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Plan Result'),
      ),
      body: mealPlan.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: mealPlan.length,
              itemBuilder: (context, index) {
                var day = mealPlan.keys.elementAt(index);
                var meals = mealPlan[day]['meals'];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    for (var meal in meals)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal['title'] ?? 'No meal data found',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('Type: ${meal['type'] ?? 'Unknown'}'),
                          SizedBox(height: 8),
                          Text(
                              'Ready in ${meal['readyInMinutes'] ?? 'Unknown'} minutes'),
                          SizedBox(height: 16),
                        ],
                      ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
    );
  }
}
