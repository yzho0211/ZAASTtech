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
                Icons.medication, // Added medication icon
                navigateToMedicineReminders,
              ),
              _buildReminderButton(
                context,
                'Your Appointments',
                "Set a reminder for your doctor's appointments",
                Icons.event, // Added event icon
                navigateToAppointmentReminders,
              ),
              _buildReminderButton(
                context,
                'Refill Reminders',
                'Set a reminder to refill your prescription',
                Icons.receipt, // Added receipt icon
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
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, color: Colors.deepPurple),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF19297C),
            ),
          ),
        ],
      ),
    );
  }
}

