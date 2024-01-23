import 'package:employee_record/models/add_emp_model.dart';
import 'package:employee_record/screens/add_employee/controllers/add_employee_controller.dart';
import 'package:employee_record/widgets/container_bg.dart';
import 'package:employee_record/widgets/text_field_view.dart';
import 'package:employee_record/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AddEmployee extends ConsumerStatefulWidget {
  const AddEmployee({super.key});

  @override
  ConsumerState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends ConsumerState<AddEmployee> {
  String? roleTypeVal;
  bool onSelected = false;
  bool onCancelSelected = false;
  bool onSaveSelected = false;

  changeTypeOfRole(int value) {
    setState(() {
      roleTypeVal = typeOfRoles[value];
      ref.read(addEmployeeController.notifier).roleType.text =
          roleTypeVal ?? "";
    });
    Navigator.of(context).pop();
  }

  List<String> typeOfRoles = [
    "Product Designer",
    "Flutter Developer",
    "QA Tester",
    "Product Owner",
  ];

  @override
  Widget build(BuildContext context) {
    final controllereRef = ref.read(addEmployeeController.notifier);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Add Employee Details",
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(
              height: 50,
              child: TextFieldView(
                maxLength: 50,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                hintText: "Employee Name",
                prefixIcon: prefixIconWidget(
                  const Icon(
                    Icons.person_2_outlined,
                    color: Colors.blue,
                  ),
                ),
                controller: controllereRef.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              height: 50,
              child: TextFieldView(
                onTap: () => openBottomSheet(context),
                maxLength: 50,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                hintText: "Select role",
                prefixIcon: prefixIconWidget(
                  const Icon(
                    Icons.work_outline,
                    color: Colors.blue,
                  ),
                ),
                controller: controllereRef.roleType,
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextFieldView(
                      maxLength: 50,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: "Select Date",
                      prefixIcon: prefixIconWidget(
                        const Icon(
                          Icons.event,
                          color: Colors.blue,
                        ),
                      ),
                      controller: controllereRef.startDate,
                      onTap: () => showdatepicker(true,
                          controller: controllereRef.startDate,
                          controllereRef: controllereRef),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextFieldView(
                      maxLength: 50,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: "No Date",
                      prefixIcon: prefixIconWidget(
                        const Icon(
                          Icons.event,
                          color: Colors.blue,
                        ),
                      ),
                      controller: controllereRef.endDate,
                      onTap: () => showdatepicker(false,
                          controller: controllereRef.endDate,
                          controllereRef: controllereRef),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Divider(
              thickness: 0.4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        onCancelSelected = !onCancelSelected;

                        controllereRef.name.clear();
                        controllereRef.roleType.clear();
                        controllereRef.startDate.clear();
                        controllereRef.endDate.clear();
                        Navigator.of(context).pop();
                      });
                    },
                    child: ContainerBG(
                        radius: 4,
                        width: 50,
                        height: 30,
                        fillColor: onCancelSelected
                            ? Colors.blue
                            : Color.fromARGB(255, 206, 246, 255),
                        child: TextView(
                            text: "Cancel",
                            color: onCancelSelected
                                ? Colors.white
                                : Colors.blue))),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        onSaveSelected = !onSaveSelected;
                        AddEmployeeModel addEmp = AddEmployeeModel(
                            name: controllereRef.name.text.trim(),
                            role: controllereRef.roleType.text,
                            startDate: controllereRef.startDate.text,
                            endDate: controllereRef.endDate.text);

                        controllereRef.name.clear();
                        controllereRef.roleType.clear();
                        controllereRef.startDate.clear();
                        controllereRef.endDate.clear();
                        Navigator.of(context).pop(addEmp);
                      });
                    },
                    child: ContainerBG(
                        radius: 4,
                        width: 50,
                        height: 30,
                        fillColor: onSaveSelected
                            ? Colors.blue
                            : Color.fromARGB(255, 206, 246, 255),
                        child: TextView(
                            text: "Save",
                            color:
                                onSaveSelected ? Colors.white : Colors.blue))),
              ],
            )
          ]),
        ),
      ),
    );
  }

  prefixIconWidget(Widget image) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 2,
          ),
          image,
          const SizedBox(
            width: 2,
          ),
          const VerticalDivider(
            color: Colors.white,
            width: 0,
            thickness: 1.5,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  Future openBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ContainerBG(
              height: 200.0,
              allRadius: true,
              topLeft: 12,
              topRight: 12,
              fillColor: Colors.white,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => changeTypeOfRole(index),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child:
                            Center(child: TextView(text: typeOfRoles[index])),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        thickness: 0.4,
                      ),
                  itemCount: typeOfRoles.length));
        });
  }

  showdatepicker(bool isStartDate,
      {required TextEditingController controller,
      AddEmployeeController? controllereRef}) async {
    DateTime? pickedDate;
    if (isStartDate) {
      pickedDate = await showDatePicker(
        lastDate: DateTime.now(),
        firstDate: DateTime(1800),
        context: context,
        confirmText: "Save",
        cancelText: "Cancel",
      );
    } else {
      var fromDate = controllereRef?.startDatetime;
      DateTime firstDate = DateTime(
        fromDate?.year ?? 0,
        fromDate?.month ?? 0,
        fromDate?.day ?? 0,
      );
      pickedDate = await showDatePicker(
          lastDate: DateTime.now(),
          firstDate: firstDate,
          context: context,
          confirmText: "Save",
          cancelText: "Cancel");
    }

    if (pickedDate != null) {
      String formattedDate = DateFormat("dd MMM yyyy").format(pickedDate);
      controllereRef?.startDatetime = pickedDate;
      print(formattedDate);
      controller.text = formattedDate;
    }
  }
}
