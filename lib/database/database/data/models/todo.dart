class Todo {
  const Todo({
    required this.title,
    required this.content,
    required this.isCompleted,
    required this.createdDate,
    required this.updatedDate,
    this.id,
  });

  factory Todo.fromMap(Map<String, dynamic> map) => Todo(
        id: map['id'],
        title: map['title'],
        content: map['content'],
        isCompleted: map['isCompleted'],
        createdDate: map['createdDate'],
        updatedDate: map['updatedDate'],
      );

  final int? id;

  final String title;

  final String content;

  final int isCompleted;

  final String createdDate;

  final String updatedDate;

  Todo copyWith({
    int? id,
    String? title,
    String? content,
    int? isCompleted,
    String? createdDate,
    String? updatedDate,
  }) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        isCompleted: isCompleted ?? this.isCompleted,
        createdDate: createdDate ?? this.createdDate,
        updatedDate: updatedDate ?? this.updatedDate,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'isCompleted': isCompleted,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
    };
  }
}
