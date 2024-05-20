import 'package:flutter/material.dart';
import '../widgets/backgroundcont.dart';

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

  void navigateToHomePage() {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Reminders'),
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
                  'Your Reminders',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildReminderButton(
                context,
                'Your Medicines',
                'Set a reminder to take your medicines',
                Icons.medication,
                navigateToMedicineReminders,
              ),
              _buildReminderButton(
                context,
                'Your Appointments',
                "Set a reminder for your doctor's appointments",
                Icons.event,
                navigateToAppointmentReminders,
              ),
              _buildReminderButton(
                context,
                'Refill Reminders',
                'Set a reminder to refill your prescription',
                Icons.receipt,
                navigateToRefillReminders,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToHomePage,
        child: const Icon(Icons.home),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildReminderButton(
    BuildContext context,
    String buttonText,
    String buttonTitle,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.deepPurple, size: 40),
            const SizedBox(height: 8),
            Text(
              buttonText,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              buttonTitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


