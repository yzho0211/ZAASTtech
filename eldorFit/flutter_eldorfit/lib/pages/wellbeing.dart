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
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Your mental health is just as important as your physical health. Here, you\'ll find tips and resources to help you stay mentally and emotionally well.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.deepPurple,fontWeight: FontWeight.bold),
                      ),
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
              _buildHomeTile(
                context,
                'Emergency & Help Resources',
                'Resources for mental health support',
                Icons.local_hospital,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WellbeingPage1()),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildHomeTile(
                context,
                'Mindfulness & Stress Management',
                'Tips for managing stress & being mindful',
                Icons.self_improvement,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildHomeTile(
    BuildContext context,
    String buttonText,
    String buttonTitle,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.deepPurple,
            ),
            title: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              buttonTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.deepPurple,
              ),
            ),
            onTap: onPressed,
          ),
        ),
      ),
    );
  }
}

