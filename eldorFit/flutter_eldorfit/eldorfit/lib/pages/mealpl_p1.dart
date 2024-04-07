import 'package:flutter/material.dart';
import 'mealpl_p2.dart';

class MealPlanPage1 extends StatelessWidget {
  const MealPlanPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String excludedFoods = ''; // Initialize excluded foods
    String targetCalories = '2000'; // Default target calories
    String diet = 'Whole30'; // Default diet

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Your Meal Plan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Type of Diet dropdown
            DropdownButton<String>(
              value: 'Whole30', // Default value
              onChanged: (String? newValue) {
                // Handle type of diet selection
                diet = newValue ?? 'Whole30';
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
                  child: Text(value),
                );
              }).toList(),
            ),
            // Allergies input field
            TextFormField(
              decoration: InputDecoration(labelText: 'Allergies (Optional)'),
              onChanged: (value) {
                excludedFoods = value; // Update excluded foods
              },
            ),
            // Target Calories input field
            TextFormField(
              initialValue: '2000',
              decoration: InputDecoration(labelText: 'Target Calories'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                targetCalories = value; // Update target calories
              },
            ),
            // Generate button
            ElevatedButton(
              onPressed: () {
                // Navigate to meal plan page 2 with parameters
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MealPlanPage2(
                      targetCalories: targetCalories,
                      diet: diet,
                      exclude: excludedFoods,
                    ),
                  ),
                );
              },
              child: const Text('Generate Meal Plan'),
            ),
          ],
        ),
      ),
    );
  }
}
