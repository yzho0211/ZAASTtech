import 'package:flutter/material.dart';
import 'home_page.dart';
import 'refill_model.dart';
import 'add_refill.dart';

class Refills extends StatefulWidget {
  @override
  _RefillsState createState() => _RefillsState();
}

class _RefillsState extends State<Refills> {
  List<refill_reminder> reminders = [];

  void addReminder(refill_reminder refill) {
    setState(() {
      reminders.add(refill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.center, // Center align the text
          text: TextSpan(
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
        centerTitle: true, // Center align the title
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // Set the height of the heading
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Your Refills',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/'); // Navigate to home page
              },
            ),
            ListTile(
              title: Text('Refills'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(
                    context, '/refills'); // Navigate to second page
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddRefills()),
                ).then((reminder) {
                  // Add the returned reminder to the list
                  if (reminder != null) {
                    setState(() {
                      reminders.add(reminder);
                    });
                  }
                  ;
                });
              },
              child: Text('Add Reminder'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: reminders.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(reminders[index].name),
                      // You can add additional buttons or actions for each reminder here
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
