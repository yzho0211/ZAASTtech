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
      'feedback': {
        'correct':
            'Well done, you answered correctly! Consuming 5-7 servings of fruits and vegetables daily provides essential nutrients and antioxidants that promote heart health.',
        'incorrect':
            'Oops, your answer is incorrect. The correct answer is: 5-7 servings. Consuming this amount daily provides essential nutrients and antioxidants that promote heart health.',
      },
    },
    {
      'question':
          'What is the recommended daily intake of water for maintaining heart health?',
      'options': ['2 liters', '500 milliliters', '8 cups', '1 gallon'],
      'answer': '2 liters',
      'feedback': {
        'correct':
            'Great job, that\'s the right answer! Staying hydrated with 2 liters of water daily supports heart health and overall well-being.',
        'incorrect':
            'Sorry, your answer is incorrect. The correct answer is: 2 liters. Staying hydrated with this amount of water daily supports heart health and overall well-being.',
      },
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
      'feedback': {
        'correct':
            'Excellent, you got it right! Limiting daily added sugar intake to no more than 25 grams helps maintain heart health and reduces the risk of chronic diseases.',
        'incorrect':
            'Incorrect answer. The recommended limit for daily added sugar intake for heart health is no more than 25 grams. Excessive sugar consumption can contribute to heart disease and other health issues.',
      },
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
      'feedback': {
        'correct':
            'Correct! The recommended daily limit for sodium intake to maintain heart health is less than 2000 milligrams. High sodium intake is linked to hypertension and cardiovascular diseases.',
        'incorrect':
            'That\'s not right. The recommended daily limit for sodium intake to maintain heart health is less than 2000 milligrams. High sodium intake can lead to hypertension and increase the risk of heart disease.',
      },
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
      'feedback': {
        'correct':
            'Correct! Chest pain or discomfort is a common symptom of a heart attack. It is important to seek immediate medical attention if you experience such symptoms.',
        'incorrect':
            'Incorrect answer. The symptom of a heart attack is chest pain or discomfort. It is crucial to recognize this symptom and seek medical help promptly.',
      },
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
      'feedback': {
        'correct':
            'Right on! Regular brisk walking is highly beneficial for heart health. It helps improve cardiovascular fitness and reduces the risk of heart disease.',
        'incorrect':
            'That\'s not it. The most beneficial activity for heart health is regular brisk walking. It promotes cardiovascular fitness and lowers the risk of heart disease.',
      },
    },
    {
      'question':
          'Which food is high in unhealthy trans fats and should be limited for heart health?',
      'options': ['Olive oil', 'Avocado', 'Margarine', 'Nuts'],
      'answer': 'Margarine',
      'feedback': {
        'correct':
            'Good job! Margarine is high in unhealthy trans fats and should be limited for heart health. Choose healthier fats like olive oil instead.',
        'incorrect':
            'Incorrect. Margarine is high in unhealthy trans fats, which should be limited for heart health. Consider using healthier fats like olive oil.',
      },
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
      'feedback': {
        'correct':
            'Correct! The recommended frequency of aerobic exercise for maintaining heart health is twice a week. Regular exercise is essential for cardiovascular fitness.',
        'incorrect':
            'That\'s not right. The recommended frequency of aerobic exercise for maintaining heart health is twice a week. Exercise regularly to support your heart health.',
      },
    },
    {
      'question':
          'Which nutrient is essential for maintaining healthy blood pressure levels?',
      'options': ['Iron', 'Calcium', 'Potassium', 'Vitamin E'],
      'answer': 'Potassium',
      'feedback': {
        'correct':
            'Well done! Potassium is essential for maintaining healthy blood pressure levels. Include potassium-rich foods in your diet for heart health.',
        'incorrect':
            'Incorrect answer. The essential nutrient for maintaining healthy blood pressure levels is potassium. Incorporate potassium-rich foods into your diet for heart health.',
      },
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
      'feedback': {
        'correct':
            'Correct! Trans fat is primarily responsible for raising blood cholesterol levels. Limit intake of foods high in trans fats for heart health.',
        'incorrect':
            'That\'s not it. Trans fat is the nutrient primarily responsible for raising blood cholesterol levels. Limit consumption of trans fats for heart health.',
      },
    },
    {
      'question':
          'Which cooking oil is recommended for heart health due to its high content of unsaturated fats?',
      'options': ['Soybean oil', 'Palm oil', 'Olive oil', 'Butter'],
      'answer': 'Olive oil',
      'feedback': {
        'correct':
            'Great choice! Olive oil is recommended for heart health due to its high content of unsaturated fats. It can help lower bad cholesterol levels.',
        'incorrect':
            'Incorrect. Olive oil is recommended for heart health due to its high content of unsaturated fats. It can help lower bad cholesterol levels.',
      },
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
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Correct Answer'),
              content: Text(
                quizData[currentQuestionIndex]['feedback']['correct'],
                style: TextStyle(fontSize: 20), // Adjust font size here
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 24, vertical: 20), // Adjust padding herr
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
      } else {
        // Incorrect answer
        showResult = false;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Incorrect Answer'),
              content: Text(
                quizData[currentQuestionIndex]['feedback']['incorrect'],
                style: TextStyle(fontSize: 20), // Adjust font size here
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${currentQuestionIndex + 1}/${quizData.length}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
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
                  title: Text(
                    quizData[currentQuestionIndex]['options'][index],
                    style: TextStyle(fontSize: 18),
                  ),
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
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 26),
              ),
            ),
            SizedBox(height: 20),
            if (showResult)
              Text(
                'Correct!',
                style: TextStyle(fontSize: 40, color: Colors.green),
              ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  nextQuestion();
                },
                child: Text(
                  'Next Question',
                  style: TextStyle(fontSize: 26),
                )),
          ],
        ),
      ),
    );
  }
}
