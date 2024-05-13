import 'package:flutter/material.dart';

class WellbeingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency & Help Resources'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/askforhelp.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Emergency Help',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Australian Helpline Numbers:',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_police),
            title: Text('Emergency Services (Police, Fire, Ambulance)'),
            subtitle: Text('Dial 000'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Lifeline Australia'),
            subtitle: Text('13 11 14'),
          ),
          ListTile(
            leading: Icon(Icons.mood),
            title: Text('Beyond Blue (Mental Health Support)'),
            subtitle: Text('1300 22 4636'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tips on What to Do:',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.check),
            title: Text('Stay Calm and Assess the Situation'),
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Call Emergency Services if Required'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Seek Help from Family or Friends'),
          ),
        ],
      ),
    );
  }
}