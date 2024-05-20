import 'package:flutter/material.dart';

class WellbeingPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindfulness & Stress Management'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Image.asset(
            'assets/images/page2.jpeg',
            fit: BoxFit.cover, // Adjusts the image to cover the entire space
            width: double.infinity, // Makes the image width cover the entire space
          ),
          SizedBox(height: 16),
          AnimatedText(
            text: 'What is Mindfulness?',
          ),
          SizedBox(height: 16),
          Text(
            'Mindfulness means being fully present in the moment, rather than operating on autopilot. It helps break free from unhelpful thought patterns and reactions.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'For older adults, mindfulness practices like meditation and gratitude can enhance cognitive function, mood, and reduce feelings of loneliness, depression, anxiety, and stress. Benefits include lowered heart rate and blood pressure, reduced muscle tension, and improved anxiety and stress levels.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'Developing mindfulness is a skill that requires effort, time, patience, and regular practice. While meditation is a key technique, there are other ways to learn mindfulness.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'Contact a mental health professional to explore mindfulness training options tailored to your needs.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    Icon(Icons.emoji_emotions, color: Colors.green), // Changed icon to wellness icon
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'Did you know? Long-term stress can affect how healthy your heart is in a few different ways. Recent research links high levels of stress hormones to being more likely to develop high blood pressure, which is one of the major risk factors for heart disease.',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Image.asset(
            'assets/images/page2_2.jpg',
            fit: BoxFit.cover, // Adjusts the image to cover the entire space
            width: double.infinity, // Makes the image width cover the entire space
          ),
          SizedBox(height: 16),
          Text(
            'To manage stress effectively, start by recognizing how it affects you and then create a personalized plan for relief:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          BulletText(
            text: 'Physical Impact: If stress manifests physically (e.g., high blood pressure, fatigue), try activities like walking, gentle stretches, or using a calming jar to relax.',
          ),
          SizedBox(height: 16),
          BulletText(
            text: 'Mental and Emotional Impact: If you experience mental or emotional effects (like forgetfulness, anxiety), try meditation, prayer, or practicing gratitude to shift your focus to positive thoughts.',
          ),
          SizedBox(height: 16),
          BulletText(
            text: 'Behavioral Impact: If stress alters your behavior, find healthier alternatives like going for a walk, journaling, or reaching out to a friend for support.',
          ),
          SizedBox(height: 16),
          Text(
            'Tailoring your approach to your specific stress response is key. Additionally, you can also consider these practices to reduce stress:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          BulletText(
            text: 'Participate in health programs like stress management or fitness classes.',
          ),
          BulletText(
            text: 'Engage in regular physical activity for at least 150 minutes per week, including flexibility, strength, and endurance exercises.',
          ),
          BulletText(
            text: 'Eat a balanced diet rich in fruits and vegetables, and practice mindful eating.',
          ),
          BulletText(
            text: 'Reflect on your emotional and physical needs, and connect with local support services for assistance.',
          ),
          SizedBox(height: 16),
          Text(
            'For better and personalized advice and guidance, consider consulting a healthcare professional or counselor.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  final String text;

  const AnimatedText({Key? key, required this.text}) : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;

  const BulletText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.arrow_right, size: 16),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}