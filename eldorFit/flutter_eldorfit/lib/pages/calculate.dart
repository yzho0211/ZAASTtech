import 'package:flutter/material.dart';

class CalorieCalculatorPage extends StatefulWidget {
  @override
  _CalorieCalculatorPageState createState() => _CalorieCalculatorPageState();
}

class _CalorieCalculatorPageState extends State<CalorieCalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  String _gender = 'Male';
  int _age = 60;
  double? _height;
  double? _weight;
  double? _calories;

  double calculateCalories() {
    if (_gender == 'Male') {
      return 88.362 + (13.397 * _weight!) + (4.799 * _height!) - (5.677 * _age);
    } else {
      return 447.593 + (9.247 * _weight!) + (3.098 * _height!) - (4.33 * _age);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Calculator'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Calculate Daily Caloric Intake',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            _gender == 'Male' ? Color(0xFF19297C) : Colors.grey,
                      ),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _gender = 'Male';
                          });
                        },
                        child: Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.yellow,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _gender == 'Female'
                            ? Color(0xFF19297C)
                            : Colors.grey,
                      ),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _gender = 'Female';
                          });
                        },
                        child: Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.yellow,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Center(
                  child: DropdownButton<int>(
                    value: _age,
                    onChanged: (value) {
                      setState(() {
                        _age = value!;
                      });
                    },
                    items: List.generate(
                      51,
                      (index) => DropdownMenuItem(
                        value: index + 50,
                        child: Text(
                          '${index + 50}',
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Height (cm)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter your height';
                    return null;
                  },
                  onSaved: (value) => _height = double.parse(value!),
                ),
                SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Weight (kg)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter your weight';
                    return null;
                  },
                  onSaved: (value) => _weight = double.parse(value!),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        _calories = calculateCalories();
                      });
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Daily Caloric Intake'),
                          content: Text(
                              'Your daily caloric intake is ${_calories!.toStringAsFixed(2)} calories.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.yellow,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF19297C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
