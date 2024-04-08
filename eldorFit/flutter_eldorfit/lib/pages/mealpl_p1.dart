import 'package:flutter/material.dart';
import 'mealpl_p2.dart';

class MealPlanPage1 extends StatefulWidget {
  const MealPlanPage1({Key? key}) : super(key: key);

  @override
  _MealPlanPage1State createState() => _MealPlanPage1State();
}

class _MealPlanPage1State extends State<MealPlanPage1> {
  String? selectedDiet = 'Whole30'; // Updated to allow null for initial value
  String? excludedFoods = ''; // Initialize excluded foods as nullable
  String? targetCalories = '2000'; // Default target calories

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Your Meal Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose Your Diet Type',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedDiet, // Updated to use selectedDiet
              onChanged: (String? newValue) {
                // Handle type of diet selection
                setState(() {
                  selectedDiet = newValue; // Update selectedDiet
                });
              },
              items: <String>[
                'Gluten Free',
                'Vegetarian',
                'Lacto-Vegetarian',
                'Ovo-Vegetarian',
                'Vegan',
                'Pescetarian',
                'Paleo',
                'Primal',
                'Low FODMAP',
                'Whole30',
                // Add other diet options here
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 24),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Allergies (Optional)',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: TextFormField(
                style: TextStyle(fontSize: 28), // Increased font size
                decoration: InputDecoration(
                  hintText: 'Enter your allergies',
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  excludedFoods = value; // Update excluded foods
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Target Calories',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: TextFormField(
                style: TextStyle(fontSize: 28), // Increased font size
                initialValue: '2000',
                decoration: InputDecoration(
                  hintText: 'Enter your target calories',
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  targetCalories = value; // Update target calories
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedDiet == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please choose your diet type'),
                    ),
                  );
                } else {
                  // Navigate to meal plan page 2 with parameters
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealPlanPage2(
                        targetCalories: targetCalories ?? '2000',
                        diet: selectedDiet!,
                        exclude: excludedFoods ?? '',
                      ),
                    ),
                  );
                }
              },
              child: const Text(
                'Generate Meal Plan',
                style: TextStyle(fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
