import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealPlanPage2 extends StatefulWidget {
  final String targetCalories;
  final String diet;

  MealPlanPage2({
    Key? key,
    required this.targetCalories,
    required this.diet,
  }) : super(key: key);

  @override
  _MealPlanPage2State createState() => _MealPlanPage2State();
}

class _MealPlanPage2State extends State<MealPlanPage2> {
  List<Map<String, dynamic>> mealPlan = [];
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
          mealPlan = List<Map<String, dynamic>>.from(data['week'].values);
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
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      )
          : mealPlan.isEmpty
          ? Center(
        child: Text(
          'No meal data found for the week',
          style: TextStyle(fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: mealPlan.length,
        itemBuilder: (context, index) {
          var dayPlan = mealPlan[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Day ${index + 1}: ${dayPlan['day']}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text('Breakfast: ${dayPlan['meals'][0]['title']}'),
              ),
              ListTile(
                title: Text('Lunch: ${dayPlan['meals'][1]['title']}'),
              ),
              ListTile(
                title: Text('Dinner: ${dayPlan['meals'][2]['title']}'),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}