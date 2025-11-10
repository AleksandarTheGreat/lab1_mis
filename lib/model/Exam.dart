
class Exam {
  final String name;
  final DateTime dateTime;
  final List<String> rooms;

  const Exam({required this.name, required this.dateTime, required this.rooms});

  @override
  String toString() => "${name} ${dateTime.toIso8601String()}";

  @override
  bool operator ==(Object other) {
    return other is Exam &&
      name == other.name &&
      dateTime == other.dateTime &&
      rooms == other.rooms;
  }

  @override
  int get hashCode => Object.hash(name, dateTime, rooms);
}