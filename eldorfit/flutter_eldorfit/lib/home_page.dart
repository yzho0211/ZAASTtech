import 'package:flutter/material.dart';
import 'refills.dart';

class HomePage extends StatelessWidget {
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second page when the button is pressed.
            Navigator.pushNamed(context, '/refills');
          },
          child: Text('Go to Refills'),
        ),
      ),
    );
  }
}
