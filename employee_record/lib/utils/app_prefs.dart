import 'dart:convert';

import 'package:employee_record/models/add_emp_model.dart';
import 'package:employee_record/utils/storage.dart';

const String currEmpList = "CurrentEmpList";
const String preEmpList = "PreviousEmpList";

Future<bool> saveCurrEmpList(List<AddEmployeeModel> value) async {
  var encode = jsonEncode(value);
  await StorageUtil.putString(currEmpList, encode);
  return Future.value(true);
}

List<AddEmployeeModel> getCurrEmpList() {
  String read = StorageUtil.getString(currEmpList);

  if (read.isNotEmpty) {
    final List<dynamic> jsonData = jsonDecode(read);
    var list = jsonData.map<AddEmployeeModel>((jsonItem) {
      return AddEmployeeModel.fromJson(jsonItem);
    }).toList();
    return list;
  }
  return <AddEmployeeModel>[];
}

Future<bool> savePreEmpList(List<AddEmployeeModel> value) async {
  var encode = jsonEncode(value);

  await StorageUtil.putString(preEmpList, encode);
  return Future.value(true);
}

List<AddEmployeeModel> getPreEmpList() {
  String read = StorageUtil.getString(preEmpList);

  if (read.isNotEmpty) {
    final List<dynamic> jsonData = jsonDecode(read);
    var list = jsonData.map<AddEmployeeModel>((jsonItem) {
      return AddEmployeeModel.fromJson(jsonItem);
    }).toList();
    return list;
  }
  return <AddEmployeeModel>[];
}
