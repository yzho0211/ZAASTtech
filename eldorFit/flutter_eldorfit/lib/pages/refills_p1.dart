import 'package:flutter/material.dart';
import 'refills_p2.dart';

class Refill {
  String medicineName;
  int totalTablets;
  int tabletsPerDay;
  DateTime reminderDate;

  Refill({
    required this.medicineName,
    required this.totalTablets,
    required this.tabletsPerDay,
    required this.reminderDate,
  });

  int get pillsLeft => totalTablets - tabletsPerDay * DateTime.now().difference(reminderDate).inDays;

  bool get isReminderDue => pillsLeft <= 5 * tabletsPerDay;
}

//list of refills
List<Refill> refillsList = [
  // Example refill with logic to calculate the remaining pills and reminder date
  
  // Add more refills here
];

class RefillsPage1 extends StatelessWidget {
  const RefillsPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Refills'),
      ),
      body: ListView.builder(
        itemCount: refillsList.length,
        itemBuilder: (context, index) {
          final refill = refillsList[index];
          return ListTile(
            title: Text(refill.medicineName),
            subtitle: Text('Pills left: ${refill.pillsLeft}'),
            trailing: refill.isReminderDue ? const Icon(Icons.alarm, color: Colors.red) : null,
            onTap: () {
              // Logic to display refill details or navigate to another page
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RefillsPage2()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
