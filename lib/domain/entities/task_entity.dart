class Task {
  Task({
    this.id,
    required this.name,
    this.isCompleted,
  });

  final int? id;
  final String name;
  bool? isCompleted;

  int get isCompletedAsInt => isCompleted == true ? 1 : 0;

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      isCompleted: json['isCompleted'],
    );
  }
}
