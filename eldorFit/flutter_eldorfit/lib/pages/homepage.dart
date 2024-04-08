import 'package:flutter/material.dart';
import 'medrem_p1.dart'; // This file contains the MedicineRemindersPage1 class and global medicine reminders list
import 'refills_p1.dart'; // This file contains the RefillsPage1 class
import 'appointments_p1.dart'; // This file contains the AppointmentsPage1 class and appointmentsList
import '../widgets/backgroundcont.dart'; // This file contains the BackgroundContainer class
import 'health_p1.dart'; // Assuming this file contains the HealthAwarenessPage class or similar
import 'mealpl_p1.dart'; // Assuming this file contains the MealPlanPage1 class

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateToMedicineReminders() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MedicineRemindersPage1()));
  }

  void navigateToRefills() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RefillsPage1()));
  }

  void navigateToAppointments() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AppointmentsPage1()));
  }

  void navigateToHealthAwareness() {
    // Replace with your actual Health Awareness Page navigation
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizPage()));
  }

  void navigateToMealPlanner() {
    // Replace with your actual Meal Planner Page navigation
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MealPlanPage1()));
  }

  @override
  Widget build(BuildContext context) {
    Widget upcomingMedicineRemindersWidget =
        MedicineRemindersPage1.medicineReminders.isNotEmpty
            ? Card(
                color: Colors.yellow,
                child: ListTile(
                  title: const Text('You have upcoming medicine reminders',
                      style: TextStyle(color: Colors.black)),
                  onTap: navigateToMedicineReminders,
                ),
              )
            : SizedBox.shrink();

    Widget upcomingAppointmentsWidget = appointmentsList.isNotEmpty
        ? Card(
            color: Colors.white,
            child: ListTile(
              title: const Text('You have upcoming appointments',
                  style: TextStyle(color: Colors.black)),
              onTap: navigateToAppointments,
            ),
          )
        : SizedBox.shrink();

    return Scaffold(
      appBar: AppBar(
        title: const Text('EldorFit'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu_book),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Welcome to EldorFit',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const Divider(height: 20, thickness: 2),
              upcomingMedicineRemindersWidget,
              upcomingAppointmentsWidget,
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  _buildCard(context, 'Appointments', Icons.calendar_today,
                      navigateToAppointments),
                  _buildCard(context, 'Your Refills', Icons.local_pharmacy,
                      navigateToRefills),
                  _buildCard(context, 'Medicine Reminders', Icons.book,
                      navigateToMedicineReminders),
                  _buildCard(context, 'Learn about health topics', Icons.school,
                      navigateToHealthAwareness),
                  _buildCard(context, 'Your Meal Planner',
                      Icons.restaurant_menu, navigateToMealPlanner),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'EldorFit\nYour guide to better health and happiness!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      drawer: _buildDrawer(context),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title, textAlign: TextAlign.center),
            ),
          ],
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
            title: const Text('Appointments'),
            onTap: navigateToAppointments,
          ),
          ListTile(
            leading: const Icon(Icons.local_pharmacy),
            title: const Text('Medicine Reminders'),
            onTap: navigateToMedicineReminders,
          ),
          ListTile(
            leading: const Icon(Icons.replay),
            title: const Text('Refills'),
            onTap: navigateToRefills,
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
        ],
      ),
    );
  }
}
