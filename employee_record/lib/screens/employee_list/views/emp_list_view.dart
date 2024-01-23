import 'package:employee_record/constants/images.dart';
import 'package:employee_record/models/add_emp_model.dart';
import 'package:employee_record/screens/add_employee/views/add_employee_view.dart';
import 'package:employee_record/screens/employee_list/controllers/emp_list_controller.dart';
import 'package:employee_record/utils/app_prefs.dart';
import 'package:employee_record/widgets/container_bg.dart';
import 'package:employee_record/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeeListView extends ConsumerStatefulWidget {
  const EmployeeListView({super.key, required this.title});

  final String title;

  @override
  ConsumerState<EmployeeListView> createState() => _EmployeeListViewState();
}

class _EmployeeListViewState extends ConsumerState<EmployeeListView> {
  Future<void> _incrementCounter() async {
    var result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const AddEmployee();
    }));
    var notifier = ref.read(employeeListControllerProvider.notifier);
    setState(() {
      if (result != null) {
        notifier.addemployee(result);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    var notifier = ref.read(employeeListControllerProvider.notifier);

    notifier.preemplyeeList = getPreEmpList();
    notifier.curemplyeeList = getCurrEmpList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;

    final controllereRef = ref.read(employeeListControllerProvider.notifier);
    var curemplyeeList = controllereRef.curemplyeeList;
    var preemplyeeList = controllereRef.preemplyeeList;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            preemplyeeList.isNotEmpty || curemplyeeList.isNotEmpty
                ? followersList(
                    curemplyeeList, preemplyeeList, controllereRef, size)
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      height: size.height -
                          (padding.top +
                              AppBar().preferredSize.height +
                              padding.bottom +
                              kBottomNavigationBarHeight +
                              55 + //tab bar height
                              60 //drop down height
                          ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Images.norecordfound,
                            width: size.width * 0.6,
                            height: size.width * 0.7,
                          ),
                          const SizedBox(height: 11),
                          TextView(
                            text: "no employee records found",
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
            Spacer(),
            controllereRef.curemplyeeList.isNotEmpty ||
                    controllereRef.preemplyeeList.isNotEmpty
                ? Stack(alignment: AlignmentDirectional.centerEnd, children: [
                    ContainerBG(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 50, left: 10),
                      width: double.infinity,
                      height: 90,
                      fillColor: Color.fromARGB(255, 242, 242, 242),
                      child: TextView(
                        text: "Swipe left to delete",
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 25,
                      child: FloatingActionButton(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        onPressed: _incrementCounter,
                        tooltip: 'Increment',
                        child: const Icon(
                          Icons.add,
                          size: 26,
                        ),
                      ),
                    ),
                  ])
                : Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: FloatingActionButton(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      child: const Icon(
                        Icons.add,
                        size: 26,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget followersList(
      List<AddEmployeeModel> curemplyeeList,
      List<AddEmployeeModel> preemplyeeList,
      EmployeeListController controllereRef,
      Size size) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildItems(curemplyeeList, size, true),
          buildItems(preemplyeeList, size, false),
        ],
      ),
    );
  }

  Widget buildItems(
      List<AddEmployeeModel> emplyeelist, Size size, bool isCurrent) {
    return Column(
      children: [
        emplyeelist.isEmpty
            ? const SizedBox.shrink()
            : ContainerBG(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                height: 50,
                fillColor: Color.fromARGB(255, 227, 226, 226),
                child: TextView(
                  text: isCurrent ? "Current Employees" : "Previous Employees",
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
        emplyeelist.isEmpty
            ? const SizedBox.shrink()
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(thickness: .4),
                itemCount: emplyeelist.length,
                itemBuilder: (BuildContext context, int index) {
                  List<AddEmployeeModel> list = emplyeelist;
                  AddEmployeeModel model = list[index];
                  return buildItem(model, index, list, size);
                }),
      ],
    );
  }

  Widget buildItem(AddEmployeeModel model, int index,
      List<AddEmployeeModel> list, Size size) {
    return Dismissible(
      key: Key(model.name!),
      onDismissed: (direction) {
        setState(() {
          list.removeAt(index);
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Employee data has been deleted'),
            action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  setState(() {
                    list.insert(index, model);
                  });
                })));
      },
      background: ContainerBG(
          fillColor: Colors.red,
          child: Icon(
            Icons.delete_outline_sharp,
            color: Colors.white,
            size: 30,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: model.name!,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            TextView(
              text: model.role!,
              fontSize: 11,
              color: const Color.fromARGB(255, 139, 138, 138),
            ),
            model.endDate!.isNotEmpty
                ? TextView(
                    text: "${model.startDate} - ${model.endDate}",
                    fontSize: 11,
                    color: const Color.fromARGB(255, 139, 138, 138),
                  )
                : TextView(
                    text: "From ${model.startDate}",
                    fontSize: 11,
                    color: const Color.fromARGB(255, 139, 138, 138),
                  ),
          ],
        ),
      ),
    );
  }
}
