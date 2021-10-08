import 'package:flutter/cupertino.dart';

class Todo {
  int id;
  String userId;
  String task;
  bool isComplete;
  String insertedAt;

  Todo({
    @required this.id,
    @required this.userId,
    @required this.task,
    @required this.isComplete,
    @required this.insertedAt,
  });

  factory Todo.fromJSON(Map<String, dynamic> map) {
    return Todo(
        id: map["id"],
        userId: map["user_id"],
        task: map["task"],
        isComplete: map["is_complete"],
        insertedAt: map["inserted_at"]);
  }
  Map<String, dynamic> toJSON() => {
    'id' : id,
    'user_id' : userId,
    'task' : task,
    'is_complete' : isComplete,
    'inserted_at' : insertedAt,
  };
}