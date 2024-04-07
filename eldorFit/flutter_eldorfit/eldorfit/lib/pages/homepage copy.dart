import 'package:flutter/material.dart';
import 'medrem_p1.dart'; // Ensure this file contains the MedicineRemindersPage1 class
import 'refills_p1.dart'; // Ensure this file contains the RefillsPage1 class

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showReminder = true;

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
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
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                _buildCard(context, 'Appointments', Icons.calendar_today, () {
                  // Placeholder for Appointments navigation
                }),
                _buildCard(context, 'Your Refills', Icons.local_pharmacy, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RefillsPage1()),
                  );
                }),
                _buildCard(context, 'Medicine Reminders', Icons.book, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MedicineRemindersPage1()),
                  );
                }),
                _buildCard(context, 'Learn about health topics', Icons.school, () {
                  // Placeholder for Health Awareness navigation
                }),
                _buildCard(context, 'Your Meal Planner', Icons.restaurant_menu, () {
                  // Placeholder for Meal Planner navigation
                }),
                // Add more cards if necessary
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
            title: const Text('Your Appointments'),
            onTap: () {
              // Placeholder for Appointments navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_pharmacy),
            title: const Text('Your Medicines'),
            onTap: () {
              // Placeholder for Medicines navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.replay),
            title: const Text('Your Refills'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RefillsPage1()),
              );
            },
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
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Medicine Reminders'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MedicineRemindersPage1()),
              );
            },
          ),
          // Add more list tiles if necessary
        ],
      ),
    );
  }
}


