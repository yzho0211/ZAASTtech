import 'package:flutter/material.dart';

class HealthTrendPage extends StatefulWidget {
  @override
  _HealthTrendPageState createState() => _HealthTrendPageState();
}

class _HealthTrendPageState extends State<HealthTrendPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Australian Dietary Trends'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          _buildTrendSection(
            'Fruit Intake',
            'lib/visualisations/Fruit.png',
            [
              'Majority across all age groups and genders fall short of recommended daily intake.',
              '25-34 age group shows the largest deficiency.',
              'Slight improvement in consumption with age, but declines again in the 75+ group.',
              'Persistent gender gap: men consume less fruit than women across all ages.'
            ],
          ),
          _buildTrendSection(
            'Vegetable Intake',
            'lib/visualisations/veg.png',
            [
              'Most individuals, across all ages, do not meet the recommended daily intake.',
              'Lowest consumption seen in the 45-54 age group, especially among women.',
              'Slight increase for the 65-74 group, but still below recommendations.',
              'Gender gap exists: women generally consume less than men, except for the 35-44 range.'
            ],
          ),
          _buildTrendSection(
            'Unhealthy Drink Consumption',
            'lib/visualisations/drinks.png',
            [
              'Men consistently consume more unhealthy drinks per week than women across all age groups.',
              'Highest consumption occurs in the 25-34 age group for both genders.',
              'Significant decline in consumption as age increases.',
              'Even though we see a decreasing trend, the overall consumption is still quite high with 1 in 5 elderly reported daily consumption of such unhealthy drinks.'
            ],
          ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (int page) {
          _pageController.animateToPage(
            page,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.apple),
            label: 'Fruit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grass),
            label: 'Vegetables',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Drinks',
          ),
        ],
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
            offset: Offset(0, 3),
          ),
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
          for (String point in bulletPoints)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.circle, size: 8.0),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
