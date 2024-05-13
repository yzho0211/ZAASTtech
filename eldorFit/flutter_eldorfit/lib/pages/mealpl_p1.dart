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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Choose Your Diet Type',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19297C),
                  ),
                ),
              ),
              Center(
                child: DropdownButton<String>(
                  value: selectedDiet,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDiet = newValue;
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
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style:
                            TextStyle(fontSize: 24, color: Color(0xFF19297C)),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Allergies (Optional)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19297C),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your allergies',
                  hintStyle: TextStyle(color: Color(0xFF19297C)),
                ),
                style: TextStyle(fontSize: 28, color: Color(0xFF19297C)),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  excludedFoods = value;
                },
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Target Calories',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19297C),
                  ),
                ),
              ),
              TextFormField(
                initialValue: '2000',
                decoration: InputDecoration(
                  hintText: 'Enter your target calories',
                  hintStyle: TextStyle(color: Color(0xFF19297C)),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 28, color: Color(0xFF19297C)),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  targetCalories = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (selectedDiet == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please choose your diet type'),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealPlanPage2(
                          targetCalories: targetCalories ?? '2000',
                          diet: selectedDiet!,
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Generate Meal Plan',
                  style: TextStyle(fontSize: 28, color: Color(0xFFFEE440)),
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
        ),
      ),
    );
  }
}
