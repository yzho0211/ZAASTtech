import 'package:flutter/material.dart';
import '../widgets/backgroundcont.dart'; // This file contains the BackgroundContainer class
import 'health_p1.dart'; // This file should now contain the HealthPage class
import 'mealpl_p1.dart'; // This file contains the MealPlanPage1 class

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateToMedicineReminders() {
    Navigator.pushNamed(context, '/medicines');
  }

  void navigateToRefills() {
    Navigator.pushNamed(context, '/refills');
  }

  void navigateToAppointments() {
    Navigator.pushNamed(context, '/appointments');
  }

  void navigateToHealthAwareness() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HealthPage()));
  }

  void navigateToMealPlanner() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MealPlanPage1()));
  }

  @override
  Widget build(BuildContext context) {
    // Widget upcomingMedicineRemindersWidget = medicineReminders.isNotEmpty
    //     ? Card(
    //         color: Colors.yellow,
    //         child: ListTile(
    //           title: const Text('You have upcoming medicine reminders',
    //               style: TextStyle(color: Colors.black)),
    //           onTap: navigateToMedicineReminders,
    //         ),
    //       )
    //     : SizedBox.shrink();

    // Widget upcomingAppointmentsWidget = appointmentsList.isNotEmpty
    //     ? Card(
    //         color: Colors.white,
    //         child: ListTile(
    //           title: const Text('You have upcoming appointments',
    //               style: TextStyle(color: Colors.black)),
    //           onTap: navigateToAppointments,
    //         ),
    //       )
    //     : SizedBox.shrink();

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.center, // Center align the text
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Eldor',
                style: TextStyle(
                  color: Colors.black, // Black color for "Elder"
                  fontSize: 24,
                ),
              ),
              TextSpan(
                text: 'Fit',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 234, 180, 3), // Yellow color for "Fit"
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true, // Center align the title,
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
              // upcomingMedicineRemindersWidget,
              // upcomingAppointmentsWidget,
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
