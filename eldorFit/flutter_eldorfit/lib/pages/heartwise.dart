import 'package:flutter/material.dart';
import '../widgets/backgroundcont.dart'; 

class HeartWisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Be HeartWise'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Be HeartWise',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 253, 253, 253),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildFeatureTile(
                context,
                'View Statistics',
                'Australian Dietary Guidelines for the Elderly',
                Icons.analytics,
                () {
                  Navigator.pushNamed(context, '/health_p1');
                },
              ),
              _buildFeatureTile(
                context,
                'Take the Quiz',
                'Check your understanding of dietary guidelines',
                Icons.quiz,
                () {
                  Navigator.pushNamed(context, '/quiz');
                },
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Explore vital heart health statistics for seniors and test your knowledge with our interactive quiz.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureTile(
    BuildContext context,
    String buttonText,
    String buttonTitle,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
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
                fontSize: 28,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              buttonTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
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

