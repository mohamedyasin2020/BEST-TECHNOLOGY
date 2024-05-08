import 'package:flutter/material.dart';
import 'package:flutter_database/database_helper.dart';
import 'package:flutter_database/details_page.dart';
import 'package:flutter_database/home_page.dart';
import 'package:flutter_database/main.dart';

class Registor extends StatefulWidget {
  const Registor({Key? key}) : super(key: key);

  @override
  State<Registor> createState() => _RegistorState();
}

class _RegistorState extends State<Registor> {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _studentMobileController =
      TextEditingController();
  final TextEditingController _studentGmailController = TextEditingController();
  final TextEditingController _studentCourseController =
      TextEditingController();
  String? _selectedDropdownValue;
  bool _validationName = false;
  bool _validationMobile = false;
  bool _validationGmail = false;
  bool _validationdropdown = false;
  bool _validationCourse = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Homepage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 10,
        centerTitle: true,
        title: const Text(
          'Register Form',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                    ), // Leading icon for Name TextFormField
                    SizedBox(
                        width: 20), // Spacer between icon and TextFormField
                    SizedBox(
                      width: 280,
                      height: 70,
                      child: TextFormField(
                        controller: _studentNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Name',
                          hintText: 'Enter Name',
                          errorText:
                              _validationName ? "Name can't Be Empty " : null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                    ), // Leading icon for Mobile TextFormField
                    SizedBox(width: 20),
                    SizedBox(
                      width: 280,
                      height: 70,
                      child: TextFormField(
                        controller: _studentMobileController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Mobile No',
                          hintText: 'Enter Mobile No',
                          errorText: _validationMobile
                              ? "Mobile can't Be Empty "
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mail_lock_outlined,
                      color: Colors.black,
                    ), // Leading icon for Email TextFormField
                    SizedBox(width: 20),
                    SizedBox(
                      width: 280,
                      height: 70,
                      child: TextFormField(
                        controller: _studentGmailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Gmail',
                          hintText: 'Enter Gmail Id',
                          errorText:
                              _validationGmail ? "Email can't Be Empty " : null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: Colors.black,
                    ), // Leading icon for Mobile TextFormField
                    SizedBox(width: 20),
                    SizedBox(
                      width: 280,
                      height: 70,
                      child: TextFormField(
                        controller: _studentCourseController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Course',
                          hintText: 'Enter your coures',
                          errorText:
                              _validationCourse ? "can't Be Empty " : null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                    ), // Leading icon for Dropdown
                    SizedBox(width: 20),
                    SizedBox(
                      width: 280,
                      height: 70,
                      child: DropdownButtonFormField<String>(
                        value: _selectedDropdownValue,
                        items: <String>['BCA', 'MCA', "Bsc(IT)","Msc(IT)","BE(cse)","ME(cse)"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedDropdownValue = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Department',
                          hintText: 'Select Your department',
                          errorText:
                              _validationdropdown ? " can't Be Empty " : null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //onPrimary: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            _validationName =
                                _studentNameController.text.isEmpty;
                            _validationMobile =
                                _studentMobileController.text.isEmpty;
                            _validationGmail =
                                _studentGmailController.text.isEmpty;
                            _validationCourse =
                                _studentCourseController.text.isEmpty;
                            _validationdropdown =
                                _selectedDropdownValue == null;

                            if (!_validationName &&
                                !_validationMobile &&
                                !_validationGmail &&
                                !_validationCourse &&
                                !_validationdropdown) {
                              print('--------------->Save Button Clicked');
                              _save();
                            }
                          });
                        },
                        child: const Text('Submit',style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // onPrimary: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          print("------------------->Clear All clicked");
                          _clearFields();
                        },
                        child: const Text("Clear",style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save() async {
    print('--------------->Save Method');
    print('------------------> Name : ${_studentNameController.text}');
    print('------------------>Mobile No : ${_studentMobileController.text}');
    print('------------------> Email Id : ${_studentGmailController.text}');
    print('------------------> course : ${_studentCourseController.text}');

    print('------------------>Selected Option : $_selectedDropdownValue');

    Map<String, dynamic> row = {
      Helperdb.Name: _studentNameController.text,
      Helperdb.Mobile: _studentMobileController.text,
      Helperdb.Gmail: _studentGmailController.text,
      Helperdb.Course: _studentCourseController.text,
      Helperdb.Department: _selectedDropdownValue,

    };
    final res = await databasehelper.insertpersondeatils(row);
    debugPrint('----------------> Inserted Id : $res');


    if (res > 0) {
      _showSuccessfulSnackBar(context, "Saved");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>Details(),
      ));
    }
  }

  void _clearFields() {
    _studentNameController.clear();
    _studentMobileController.clear();
    _studentGmailController.clear();
    _studentCourseController.clear();
  }
  void _showSuccessfulSnackBar(BuildContext context, String toastmgs) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(toastmgs)));
  }
}
