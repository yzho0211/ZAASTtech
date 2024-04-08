import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity/connectivity.dart';

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
// <<<<<<< HEAD

  List<Map<String, String>> meals = [
    {'meal1': 'id1'},
    {'meal2': 'id2'},
  ];
  List<Map<String, dynamic>> mealPlan = List.generate(7, (index) {
    // Initialize each day with empty strings for meals and nutrients
    return {
      'meals': {'id': '', 'title': ''},
      // Assuming 'title' and 'description' keys
      'nutrients': '',
    };
  }); // Initialize meal plan list
// =======
//   Map<String, dynamic> mealPlan = {};
// >>>>>>> 977021987eda8fec939f81cc8b063c487cad676d

  @override
  void initState() {
    super.initState();
    generateMealPlan();
  }

  Future<bool> checkInternetConnectivity() async {
    try {
      final response = await http.head(Uri.parse("https://www.google.com"));
      // If the response status code is 200, it means internet is accessible
      return response.statusCode == 200;
    } catch (e) {
      // If an error occurs (e.g., network error), it means internet is not accessible
      return false;
    }
  }

  Future<void> generateMealPlan() async {
    // Make API request to generate meal plan with parameters
    if (await checkInternetConnectivity()) {
      print("Internet");
    }
    else {
      print("No internet");
    }
    var response = await http.get(Uri.parse(
        'https://api.spoonacular.com/mealplanner/generate?apiKey=b4757d256a764b2bbcad36698241424c&timeFrame=week&targetCalories=${widget
            .targetCalories}&diet=${widget.diet}&exclude=${widget.exclude}'));

    if (response.statusCode == 200) {
      // Meal plan generated successfully, handle response data
      var data = jsonDecode(response.body);
      // print(data['week']['monday']);
      setState(() {
        if (data['week'] != null) {
          setState(() {
            // mealPlan = [
            //   {'day': 'Monday', 'data': data['week']['monday']},
            //   {'day': 'Tuesday', 'data': data['week']['tuesday']},
            //   {'day': 'Wednesday', 'data': data['week']['wednesday']},
            //   {'day': 'Thursday', 'data': data['week']['thursday']},
            //   {'day': 'Friday', 'data': data['week']['friday']},
            //   {'day': 'Saturday', 'data': data['week']['saturday']},
            //   {'day': 'Sunday', 'data': data['week']['sunday']},
            // ];
            mealPlan[0] = {
              'meals': data['week']['monday']['meals'],
              'nutrients': data['week']['monday']['nutrients']
            };
            mealPlan[1] = {
              'meals': data['week']['tuesday']['meals'],
              'nutrients': data['week']['tuesday']['nutrients']
            };
            mealPlan[2] = {
              'meals': data['week']['wednesday']['meals'],
              'nutrients': data['week']['wednesday']['nutrients']
            };
            mealPlan[3] = {
              'meals': data['week']['thursday']['meals'],
              'nutrients': data['week']['thursday']['nutrients']
            };
            mealPlan[4] = {
              'meals': data['week']['friday']['meals'],
              'nutrients': data['week']['friday']['nutrients']
            };
            mealPlan[5] = {
              'meals': data['week']['saturday']['meals'],
              'nutrients': data['week']['saturday']['nutrients']
            };
            mealPlan[6] = {
              'meals': data['week']['sunday']['meals'],
              'nutrients': data['week']['sunday']['nutrients']
            };
          });
        } else {
          // Handle the case where meals data is null
          print('Meal data is null');
          // print(jsonDecode(response.body)['week']);
        }
      });
    } else {
      // Failed to generate meal plan, handle error
      print('Failed to generate meal plan: ${response.statusCode}');
      try {
        String queryParams =
            'apiKey=b4757d256a764b2bbcad36698241424c&timeFrame=week&targetCalories=${widget
            .targetCalories}&diet=${widget.diet}';

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
// >>>>>>> 977021987eda8fec939f81cc8b063c487cad676d
      }
      print(mealPlan);
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Meal Plan Result'),
        ),
// <<<<<<< HEAD
        body: ListView.builder(
          itemCount: mealPlan.length,
          itemBuilder: (context, index) {
            print(index);
            print(mealPlan[index]['meals']);
            // var meal = mealPlan[index];
            return ListTile(
              title: Text(
                  'Option ${index + 1} - ${mealPlan[index]['meals']['title']}'),
              subtitle: Text('Nutrients: ${mealPlan[index]['nutrients']}'),
            );
          },
        ),
// =======
//         body: mealPlan.isEmpty
//             ? Center(
//           child: CircularProgressIndicator(),
//         )
//             : ListView.builder(
//           itemCount: mealPlan.length,
//           itemBuilder: (context, index) {
//             var day = mealPlan.keys.elementAt(index);
//             var meals = mealPlan[day]['meals'];
//
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   day,
//                   style:
//                   TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 for (var meal in meals)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         meal['title'] ?? 'No meal data found',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 8),
//                       Text('Type: ${meal['type'] ?? 'Unknown'}'),
//                       SizedBox(height: 8),
//                       Text(
//                           'Ready in ${meal['readyInMinutes'] ??
//                               'Unknown'} minutes'),
//                       SizedBox(height: 16),
//                     ],
//                   ),
//                 SizedBox(height: 20),
//               ],
//             );
//           },
//         ),
// >>>>>>> 977021987eda8fec939f81cc8b063c487cad676d
      );
    }
}
