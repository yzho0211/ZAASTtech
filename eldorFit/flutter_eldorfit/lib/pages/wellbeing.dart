import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'wellbeingp1.dart';
import 'wellbeingp2.dart';

class WellbeingPage extends StatelessWidget {
  const WellbeingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wellbeing Guide'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // Set a fixed height for the container
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Caring for Your Mind and Spirit',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  CarouselSlider(
                    items: [
                      Image.asset('assets/images/wbg1.png', fit: BoxFit.cover),
                      Image.asset('assets/images/wbg2.png', fit: BoxFit.cover),
                      Image.asset('assets/images/wbg3.png', fit: BoxFit.cover),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Your mental health is just as important as your physical health. Here, you\'ll find tips and resources to help you stay mentally and emotionally well.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Explore More:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              _buildHomeButton(
                context,
                'Emergency & Help Resources',
                'Resources for mental health support',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WellbeingPage1()),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildHomeButton(
                context,
                'Mindfulness & Stress Management',
                'Tips for managing stress & being mindful',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WellbeingPage2()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButton(
    BuildContext context,
    String buttonText,
    String buttonTitle,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
      child: Column(
        children: [
          Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF19297C),
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.yellow,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF19297C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}