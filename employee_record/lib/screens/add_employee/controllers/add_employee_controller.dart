import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addEmployeeController = NotifierProvider(() => AddEmployeeController());

class AddEmployeeController extends Notifier {
  final name = TextEditingController();
  final roleType = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  DateTime? startDatetime;

  @override
  build() {}
}
