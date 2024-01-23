import 'dart:convert';
import 'package:employee_record/models/add_emp_model.dart';
import 'package:employee_record/utils/app_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final employeeListControllerProvider =
    NotifierProvider(() => EmployeeListController());

class EmployeeListController extends Notifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  List<AddEmployeeModel> curemplyeeList = [];
  List<AddEmployeeModel> preemplyeeList = [];

  @override
  build() {}

  Future<void> addemployee(AddEmployeeModel employee) async {
    if (employee.endDate!.isEmpty) {
      curemplyeeList.add(employee);
    } else {
      preemplyeeList.add(employee);
    }
    await saveCurrEmpList(curemplyeeList);
    await savePreEmpList(preemplyeeList);
  }
}
