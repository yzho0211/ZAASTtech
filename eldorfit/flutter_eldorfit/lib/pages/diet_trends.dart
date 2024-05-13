import 'package:flutter/material.dart';

class Health_trendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Australian Dietary Trends'),
        // The leading widget is optional - it's provided for clarity. The back button should appear automatically if this page was pushed onto the navigation stack.
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            } else {
              // This part is reached only if HealthPage is the first route
              // which normally shouldn't happen in your described app structure
              // Consider logging this situation or ensuring that your app's navigation flow is as expected
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Fruit intake across various age group',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Image.asset('lib/visualisations/Fruit.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'The graph reveals a concerning trend in fruit consumption habits across different age groups and genders. A majority of individuals across all age brackets failed to meet the recommended daily fruit intake, with the 25-34 age group showing the highest deficiency. Although fruit consumption generally improved with age, a slight decline was observed in the 75+ group. \n Notably, a persistent gender gap was evident, with men consistently consuming less fruit than women in every age bracket. This highlights the need for targeted interventions to encourage healthier fruit consumption habits, particularly among younger adults and men, to promote overall well-being and reduce potential health risks associated with inadequate fruit intake.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Text('Vegetable intake across various age group',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Image.asset('lib/visualisations/veg.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'The graph illustrates the percentage of individuals across different age groups who did not meet the recommended daily vegetable consumption. \n A majority of people across all age groups failed to meet the recommended intake. Notably, vegetable consumption was lowest among those aged 45-54, with a significant drop observed among women in this age bracket. While vegetable intake improved slightly in the 65-74 age range, it remained below the recommended level for all groups. \n Furthermore, a consistent gender gap is evident, with women generally consuming fewer vegetables than men across all age groups, except for the 35-44 range. This highlights a need for targeted interventions to promote increased vegetable consumption, particularly among women and middle-aged individuals, to improve overall health and well-being.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Text('Unhealthy drinks intake',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Image.asset('lib/visualisations/drinks.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Across all age groups, men generally have a higher percentage of weekly unhealthy drink consumption compared to women. The highest percentage of unhealthy drink consumption for both men and women is observed in the 25-34 age group, with a steep decline observed in subsequent age groups. Notably, the 75+ age group exhibits the lowest consumption for both genders. \n The average percentage of unhealthy drink consumption follows a similar declining trend across age groups, consistently falling between the percentages for men and women. This data highlights a concerning trend of excessive unhealthy drink consumption, particularly among younger individuals, emphasizing the need for targeted interventions to promote healthier beverage choices.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
