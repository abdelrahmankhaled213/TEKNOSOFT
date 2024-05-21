import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Task{
int id;
  String? title;
  String? category;
  String? date;
 String? priority;
  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.priority


  });
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      date: json['dates'],
      priority: json['priority']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'dates': date,
      'priority': priority
    };
  }
}