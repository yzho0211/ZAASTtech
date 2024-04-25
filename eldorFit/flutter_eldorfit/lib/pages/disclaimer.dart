import 'package:flutter/material.dart';

class DisclaimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disclaimer'),
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
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFF19297C),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'The EldorFit app is designed for elderly users, that offers various features aimed at enhancing their well-being and health management. However, it is important to recognize that while the app endeavors to provide valuable support and assistance, it does not replace professional medical advice, diagnosis, or treatment. The reminders for medication intake, doctor appointments, and prescription refills are intended to facilitate medication adherence and healthcare management. Users should consult with their healthcare providers regarding any changes to their medication regimen or treatment plans. The meal planner feature aims to achieve a balanced diet.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFEE440),
                    ),
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
