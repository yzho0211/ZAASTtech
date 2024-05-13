import 'package:flutter/material.dart';
import '../widgets/backgroundcont.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void navigateToMedicineReminders() {
    Navigator.pushNamed(context, '/medicines');
  }

  void navigateToRefills() {
    Navigator.pushNamed(context, '/refills');
  }

  void navigateToAppointments() {
    Navigator.pushNamed(context, '/appointments');
  }

  void navigateToReminders() {
    Navigator.pushNamed(context, '/reminders');
  }

  void navigateToHealthAwareness() {
    Navigator.pushNamed(context, '/health_p1');
  }

  void navigateToMealPlanner() {
    Navigator.pushNamed(context, '/mealpl_p1');
  }

  void navigateToTranslation() {
    Navigator.pushNamed(context, '/translation');
  }

  void navigateToHeartwise() {
    Navigator.pushNamed(context, '/heartwise');
  }

  void navigateToNutrition() {
    Navigator.pushNamed(context, '/nutrition');
  }

  void navigateToWellbeingGuide() {
    Navigator.pushNamed(context, '/wellbeing');
  }

  void navigateToDisclaimer() {
    Navigator.pushNamed(context, '/disclaimer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Eldorfit Home'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/EldorFit.png'),
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Welcome to\nEldorFit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF19297C),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'EldorFit is a Guide for the Elderly to Better Heart Health and Happiness',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF19297C),
                ),
              ),
              const SizedBox(height: 24),
              _buildHomeButton(
                context,
                'Your Reminders',
                'Set reminders for medicines, refills and appointments',
                navigateToReminders,
              ),
              _buildHomeButton(
                context,
                'Be HeartWise',
                'Learn the latest information on heart disease',
                navigateToHeartwise,
              ),
              _buildHomeButton(
                context,
                'Meal Plan',
                'Generate your meal plan for a week',
                navigateToNutrition,
              ),
              _buildHomeButton(
                context,
                'Wellbeing Guide', // New button for Wellbeing Guide
                'Explore resources for mental health and well-being', // New button description
                navigateToWellbeingGuide, // New button action
              ),
            ],
          ),
        ),
      ),
      drawer: _buildDrawer(context),
    );
  }

  Widget _buildHomeButton(
    BuildContext context,
    String buttonText,
    String buttonTitle,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
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
                fontSize: 28,
                color: Color(0xFFFEE440),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 25, 42, 124),
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

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Your Reminders'),
            onTap: navigateToReminders,
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Be HeartWise'),
            onTap: navigateToHeartwise,
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: const Text('Meal Planner'),
            onTap: navigateToNutrition,
          ),
          ListTile(
            leading: const Icon(Icons.replay),
            title: const Text('Translate Now'),
            onTap: navigateToTranslation,
          ),
          ListTile(
            leading: const Icon(Icons.healing),
            title: const Text('Wellbeing Guide'),
            onTap: navigateToWellbeingGuide,
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Disclaimer'),
            onTap: navigateToDisclaimer,
          ),
        ],
      ),
    );
  }
}
