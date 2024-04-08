import 'package:flutter/material.dart';
import 'medrem_p1.dart'; //  this file contains the MedicineRemindersPage1 class
import 'refills_p1.dart'; //  this file contains the RefillsPage1 class
import 'appointments_p1.dart'; //  this file contains the AppointmentsPage1 class
import '/widgets/backgroundcont.dart'; //  this file contains the BackgroundContainer class

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showReminder = true;

  void navigateToMedicineReminders() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MedicineRemindersPage1()),
    );
  }

  void navigateToRefills() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RefillsPage1()),
    );
  }

  void navigateToAppointments() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AppointmentsPage1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget upcomingAppointmentsWidget = appointmentsList.isNotEmpty
        ? Card(
            child: ListTile(
              title: Text('You have upcoming appointments'),
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
              if (_showReminder)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    color: Colors.yellow,
                    child: ListTile(
                      title: const Text('Reminder'),
                      subtitle: const Text('Did you take your Morning Medication?'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _showReminder = false;
                              });
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Placeholder for "No" action
                            },
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              upcomingAppointmentsWidget,
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  _buildCard(context, 'Appointments', Icons.calendar_today, navigateToAppointments),
                  _buildCard(context, 'Your Refills', Icons.local_pharmacy, navigateToRefills),
                  _buildCard(context, 'Medicine Reminders', Icons.book, navigateToMedicineReminders),
                  _buildCard(context, 'Learn about health topics', Icons.school, () {
                    // Placeholder for Health Awareness navigation
                  }),
                  _buildCard(context, 'Your Meal Planner', Icons.restaurant_menu, () {
                    // Placeholder for Meal Planner navigation
                  }),
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

  Widget _buildCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
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
            onTap: () {
              // Placeholder for Health Awareness navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: const Text('Meal Planner'),
            onTap: () {
              // Placeholder for Meal Planner navigation
            },
          ),
        ],
      ),
    );
  }
}









