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
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/EldorFit.png'),
                      radius: 50, // Adjust the radius to fit better
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Welcome to\nEldorFit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 252, 252, 252),
                          ),
                         ),
                          ],
                          ),
                          ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "EldorFit welcomes Seniors to a journey of vitality, guiding them towards optimal heart health and well-being as they embrace life's golden years.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildHomeButton(
                context,
                Icons.alarm,
                'Your Reminders',
                'Click here to set reminders for medicines, refills and appointments',
                navigateToReminders,
              ),
              _buildHomeButton(
                context,
                Icons.favorite,
                'Be HeartWise',
                'Learn the latest information on heart health',
                navigateToHeartwise,
              ),
              _buildHomeButton(
                context,
                Icons.food_bank,
                'Your Nutrition',
                'Click here to learn more about your Nutrition and generate a meal plan',
                navigateToNutrition,
              ),
              _buildHomeButton(
                context,
                Icons.info,
                'Wellbeing Guide', // New button for Wellbeing Guide
                'Explore resources for your Mental Health and well-being', // New button description
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
    IconData icon,
    String buttonText,
    String buttonTitle,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.deepPurple,
            ),
            title: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.deepPurple,
              ),
            ),
            subtitle: Text(
              buttonTitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: onPressed,
          ),
        ),
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
            title: const Text('Your Nutrition'),
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


