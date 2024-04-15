class Medicine {
  String name;
  String amount;
  List<String> time;
  List<String> days;
  String instructions;

  Medicine({
    required this.name,
    required this.amount,
    required this.time,
    required this.days,
    required this.instructions,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'time': time,
      'days': days,
      'instructions': instructions
    };
  }
}
