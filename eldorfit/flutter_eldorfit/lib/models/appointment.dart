class Appointment {
  String name;
  String doctor;
  String time;
  DateTime date;

  Appointment({
    required this.name,
    required this.doctor,
    required this.time,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'doctor': doctor,
      'time': time,
      'date': date.toString()
    };
  }
}
