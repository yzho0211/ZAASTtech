import 'package:flutter/material.dart';
import 'quiz.dart'; // Ensure this import matches your project structure

class HealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Visualization and Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainHealthPage(),
    );
  }
}

class MainHealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Australian Dietary Guidelines'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Men Aged 51-70',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Image.asset('lib/visualisations/men5070.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Our data reveals that Aussie men in the 51-70 bracket are coming close but not quite meeting their daily greens, with 94.5% averaging 3 servings of vegetables against a recommended 5.5. Fruit intake is trailing further behind, with only 67.1% of the ideal 2 servings being enjoyed. Grains are a success story at 75.5%, overshooting the target slightly, suggesting a good intake of cereal foods. When it comes to protein, there\'s a modest excess with an average intake that\'s 70.5% above recommendations, while dairy is being consumed enthusiastically at 94.6%, indicating a strong preference for milk, yoghurt, cheese, and alternatives.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Text('Women Aged 51-70',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Image.asset('lib/visualisations/women5070.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Australian women in the 51-70 age group are making nutritious choices but there\'s room for improvement to fully meet the Australian Dietary Guidelines. Vegetables and legume/bean consumption is promising at 92.5%, just shy of the ideal 5 servings per day. Fruit consumption, however, is at 72.8% of the 2 recommended servings. Grain foods are also below the target, with only 61.1% of the guideline being met. Protein sources like lean meats and alternatives are being consumed at 72.3% of the recommendations. Dairy products are a standout, with a near-perfect score at 99.9% of the dietary target. Overall, while dairy intake is exemplary, other areas like fruit, grains, and protein sources could use a boost to achieve a balanced diet.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              ),
              child: Text(
                'Start Heart Health Quiz',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
