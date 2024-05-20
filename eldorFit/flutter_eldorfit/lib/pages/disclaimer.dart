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
              // Log this situation or ensure that your app's navigation flow is as expected
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
            color: Colors.white,
            border: Border.all(color: Colors.purple, width: 2),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '⚠️ The EldorFit app is designed for elderly users, offering various features aimed at enhancing their well-being and health management. However, it is important to recognize that while the app endeavors to provide valuable support and assistance, it does not replace professional medical advice, diagnosis, or treatment.\n\n💊 The reminders for medication intake, doctor appointments, and prescription refills are intended to facilitate medication adherence and healthcare management. Users should consult with their healthcare providers regarding any changes to their medication regimen or treatment plans.\n\n🍽️ The meal planner feature aims to promote healthy eating habits, but users should consult with a qualified nutritionist or healthcare provider for personalized dietary recommendations, especially if they have specific dietary restrictions or health conditions.\n\n🧠 The educational quiz about health and nutrition serves to inform and empower users with relevant knowledge. Nevertheless, users should recognize that the information provided in the quiz is general in nature and may not be applicable to their individual health circumstances. Consultation with healthcare professionals is advised for personalized advice and guidance.\n\n🛡️ By using this app, users acknowledge and agree that the developers/owners of the app bear no responsibility for any direct or indirect consequences resulting from the use of the app or reliance on its content. Users are encouraged to exercise caution, seek professional medical advice when needed, and make informed decisions regarding their health and well-being.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple,
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
