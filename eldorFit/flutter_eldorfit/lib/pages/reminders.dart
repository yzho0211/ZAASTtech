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
                    color: Color(0xFF19297C),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildReminderButton(
                context,
                'Your Medicines',
                'Set a reminder to take your medicines',
                navigateToMedicineReminders,
              ),
              _buildReminderButton(
                context,
                'Your Appointments',
                'Set a reminder for your doctor’s appointments',
                navigateToAppointmentReminders,
              ),
              _buildReminderButton(
                context,
                'Refill Reminders',
                'Set a reminder to refill your prescription',
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
}
