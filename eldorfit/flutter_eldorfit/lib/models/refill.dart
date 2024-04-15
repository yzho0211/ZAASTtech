class Refill {
  String medicineName;
  int duration;

  Refill({required this.medicineName, required this.duration});

  Map<String, dynamic> toJson() {
    return {'name': medicineName, 'duration': duration};
  }
}
