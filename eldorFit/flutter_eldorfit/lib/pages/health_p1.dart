import 'package:flutter/material.dart';
import 'quiz.dart';

class HealthPage extends StatefulWidget {
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Australian Dietary Guidelines'),
      ),
      body: Column(
        // Use a Column to layout the PageView and the button
        children: <Widget>[
          Expanded(
            // Let the PageView take up available space
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() => _currentPage = page);
              },
              children: <Widget>[
                _buildTrendSection(
                  'Men Aged 51-70',
                  'lib/visualisations/men5070.png',
                  [
                    'Almost meeting daily greens intake, but not quite (3 servings vs. 5.5 recommended).',
                    'Fruit intake is further behind (67.1% of the ideal 2 servings).',
                    'Grains are a success story (75.5%, slightly above target).',
                    'Modest excess in protein intake (70.5% above recommendations).',
                    'Dairy is being consumed enthusiastically (94.6%).',
                  ],
                ),
                _buildTrendSection(
                  'Women Aged 51-70',
                  'lib/visualisations/women5070.png',
                  [
                    'Good vegetable and legume/bean consumption (92.5%, just shy of 5 servings).',
                    'Fruit consumption is below target (72.8% of the 2 recommended servings).',
                    'Grain foods are also below target (61.1%).',
                    'Protein intake is at 72.3% of recommendations.',
                    'Dairy intake is exemplary (99.9% of the dietary target).',
                  ],
                ),
              ],
            ),
          ),
          Padding(
            // Add padding to the button
            padding: const EdgeInsets.all(16.0), // Adjust padding as needed
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              ),
              child: Text(
                'Start Heart Health Quiz',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (int page) => _pageController.animateToPage(page,
            duration: Duration(milliseconds: 500), curve: Curves.ease),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.male), label: 'Men'),
          BottomNavigationBarItem(icon: Icon(Icons.female), label: 'Women'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
          } else {
            // This part is reached only if HealthPage is the first route
            // which normally shouldn't happen in your described app structure
            // Consider logging this situation or ensuring that your app's navigation flow is as expected
          }
        },
        child: Icon(Icons.home),
      ),
    );
  }

  Widget _buildTrendSection(
      String title, String imagePath, List<String> bulletPoints) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Image.asset(imagePath),
          SizedBox(height: 16),
          for (String point in bulletPoints) // Bullet points
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.circle, size: 8.0),
                  SizedBox(width: 8.0),
                  Expanded(child: Text(point, style: TextStyle(fontSize: 16))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
