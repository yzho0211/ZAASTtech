// medrem_p1.dart
import 'package:flutter/material.dart';
import 'medrem_p2.dart';

class MedicineReminder {
  String name;
  String amount;
  String time;
  String days;
  String instructions;

  MedicineReminder({
    required this.name,
    required this.amount,
    required this.time,
    required this.days,
    required this.instructions,
  });
}

class MedicineRemindersPage1 extends StatefulWidget {
  const MedicineRemindersPage1({Key? key}) : super(key: key);

  // Static list to simulate global behavior
  static List<MedicineReminder> medicineReminders = [];

  @override
  _MedicineRemindersPage1State createState() => _MedicineRemindersPage1State();
}

class _MedicineRemindersPage1State extends State<MedicineRemindersPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Medicine Reminders'),
      ),
      body: ListView.builder(
        itemCount: MedicineRemindersPage1.medicineReminders.length,
        itemBuilder: (context, index) {
          final item = MedicineRemindersPage1.medicineReminders[index];
          return Card(
            child: ListTile(
              title: Text('${item.time} - ${item.name}'),
              subtitle: Text('${item.amount}, ${item.instructions}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle the tap if needed, perhaps to edit the reminder
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMedicinePage()),
          ) as MedicineReminder?;
          // If a result was returned, add it to the list and refresh the state
          if (result != null) {
            setState(() {
              MedicineRemindersPage1.medicineReminders.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



