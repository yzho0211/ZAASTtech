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

  void navigateToDisclaimer() {
    Navigator.pushNamed(context, '/disclaimer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Welcome page'),
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
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to\nEldorFit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19297C),
                  ),
                ),
              ),
              const Text(
                'Your Guide to Better Health and Happiness',
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
                'Your Health Data',
                'Track your health & activity data',
                navigateToMedicineReminders,
              ),
              _buildHomeButton(
                context,
                'Be HeartWise',
                'Learn the latest information on heart disease',
                navigateToHealthAwareness,
              ),
              _buildHomeButton(
                context,
                'Meal Plan',
                'Generate your meal plan for a week',
                navigateToMealPlanner,
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
            leading: const Icon(Icons.local_pharmacy),
            title: const Text('Your Health Data'),
            onTap: navigateToMedicineReminders,
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Health Awareness'),
            onTap: navigateToHealthAwareness,
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: const Text('Meal Planner'),
            onTap: navigateToMealPlanner,
          ),
          ListTile(
            leading: const Icon(Icons.replay),
            title: const Text('Translate Now'),
            onTap: navigateToRefills,
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
