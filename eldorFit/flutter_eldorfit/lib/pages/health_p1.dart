import 'package:flutter/material.dart';

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heart Health Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> quizData = [
    {
      'question':
          'How many servings of fruits and vegetables are recommended per day for maintaining heart health?',
      'options': [
        '1-2 servings',
        '3-4 servings',
        '5-7 servings',
        '8-10 servings'
      ],
      'answer': '5-7 servings',
    },
    {
      'question':
          'What is the recommended daily intake of water for maintaining heart health?',
      'options': ['2 liters', '500 milliliters', '8 cups', '1 gallon'],
      'answer': '2 liters',
    },
    {
      'question':
          'What is the recommended limit for daily added sugar intake for heart health?',
      'options': [
        'No more than 50 grams',
        'No more than 100 grams',
        'No more than 25 grams',
        'No more than 10 grams'
      ],
      'answer': 'No more than 25 grams',
    },
    {
      'question':
          'What is the recommended daily limit for sodium intake to maintain heart health?',
      'options': [
        'Less than 500 milligrams',
        'Less than 1000 milligrams',
        'Less than 2000 milligrams',
        'Less than 3000 milligrams'
      ],
      'answer': 'Less than 2000 milligrams',
    },
    {
      'question': 'Which of the following is a symptom of a heart attack?',
      'options': [
        'Sudden urge to urinate',
        'Persistent cough',
        'Chest pain or discomfort',
        'Dry mouth'
      ],
      'answer': 'Chest pain or discomfort',
    },
    {
      'question': 'Which activity is most beneficial for heart health?',
      'options': [
        'Sitting for long periods',
        'Smoking',
        'Regular brisk walking',
        'Eating fast food frequently'
      ],
      'answer': 'Regular brisk walking',
    },
    {
      'question':
          'Which food is high in unhealthy trans fats and should be limited for heart health?',
      'options': ['Olive oil', 'Avocado', 'Margarine', 'Nuts'],
      'answer': 'Margarine',
    },
    {
      'question':
          'What is the recommended frequency of aerobic exercise for maintaining heart health?',
      'options': [
        'Once a month',
        'Twice a week',
        'Five times a day',
        'Three times a year'
      ],
      'answer': 'Twice a week',
    },
    {
      'question':
          'Which nutrient is essential for maintaining healthy blood pressure levels?',
      'options': ['Iron', 'Calcium', 'Potassium', 'Vitamin E'],
      'answer': 'Potassium',
    },
    {
      'question':
          'Which nutrient is primarily responsible for raising blood cholesterol levels?',
      'options': [
        'Unsaturated fat',
        'Fiber',
        'Trans fat',
        'Omega-3 fatty acids'
      ],
      'answer': 'Trans fat',
    },
    {
      'question':
          'Which cooking oil is recommended for heart health due to its high content of unsaturated fats?',
      'options': ['Soybean oil', 'Palm oil', 'Olive oil', 'Butter'],
      'answer': 'Olive oil',
    },
  ];

  int currentQuestionIndex = 0;
  String selectedAnswer = '';
  bool showResult = false;

  void checkAnswer() {
    setState(() {
      if (selectedAnswer == quizData[currentQuestionIndex]['answer']) {
        // Correct answer
        showResult = true;
      } else {
        // Incorrect answer
        showResult = false;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      selectedAnswer = '';
      showResult = false;
      if (currentQuestionIndex < quizData.length - 1) {
        currentQuestionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Quiz Completed'),
              content: Text('Congratulations! You have completed the quiz.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart Health Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quizData[currentQuestionIndex]['question'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                quizData[currentQuestionIndex]['options'].length,
                (index) => RadioListTile(
                  title: Text(quizData[currentQuestionIndex]['options'][index]),
                  value: quizData[currentQuestionIndex]['options'][index],
                  groupValue: selectedAnswer,
                  onChanged: (value) {
                    setState(() {
                      selectedAnswer = value.toString();
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                checkAnswer();
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            if (showResult)
              Text(
                'Correct!',
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                nextQuestion();
              },
              child: Text('Next Question'),
            ),
          ],
        ),
      ),
    );
  }
}