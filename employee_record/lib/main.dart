import 'package:employee_record/constants/images.dart';
import 'package:employee_record/screens/employee_list/views/emp_list_view.dart';
import 'package:employee_record/utils/storage.dart';
import 'package:employee_record/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Employee List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const EmployeeListView(title: 'Employee List'),
    );
  }
}
