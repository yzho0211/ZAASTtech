import 'package:flutter/material.dart';
import '../widgets/backgroundcont.dart'; //

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  void navigateToMedicineReminders() {
    Navigator.pushNamed(context, '/medicines');
  }

  void navigateToRefillReminders() {
    Navigator.pushNamed(context, '/refills');
  }

  void navigateToAppointmentReminders() {
    Navigator.pushNamed(context, '/appointments');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
                  'Reminders',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildReminderButton(
                context,
                'Medication Reminders',
                Icons.alarm,
                navigateToMedicineReminders,
              ),
              _buildReminderButton(
                context,
                'Appointment Reminders',
                Icons.calendar_today,
                navigateToAppointmentReminders,
              ),
              _buildReminderButton(
                context,
                'Refill Reminders',
                Icons.replay,
                navigateToRefillReminders,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReminderButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(color: Color(0xFFF8F7F9)),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Color(0xFFF8F7F9),
        ),
      ),
    );
  }
}
