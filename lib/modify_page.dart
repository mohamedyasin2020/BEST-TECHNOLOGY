import 'package:flutter/material.dart';
import 'package:flutter_database/database_helper.dart';
import 'package:flutter_database/home_page.dart';
import 'package:flutter_database/main.dart';
import 'package:flutter_database/person_model.dart';

class Modify extends StatefulWidget {
  const Modify({super.key});

  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _studentMobileController =
      TextEditingController();
  final TextEditingController _studentGmailController = TextEditingController();
  final TextEditingController _studentCourseController =
      TextEditingController();
  String? _selectedDropdownValue;
  bool firstTimeFlag = false;
  var selectRecordId = 0;

  @override
  Widget build(BuildContext context) {
    if (firstTimeFlag == false) {
      print('--------------->Once Execute');

      firstTimeFlag = true;

      //Recieving Data
      final PersonDetails =
          ModalRoute.of(context)!.settings.arguments as Persondetailsmodel;

      print('--------------->Receiving Data');
      print(PersonDetails.id);
      print(PersonDetails.personName);
      print(PersonDetails.personNo);
      print(PersonDetails.personGmail);
      print(PersonDetails.personDepartment);

      selectRecordId = PersonDetails.id!; //Handle Null
      _studentNameController.text = PersonDetails.personName;
      _studentMobileController.text = PersonDetails.personNo;
      _studentGmailController.text = PersonDetails.personGmail;
      _studentCourseController.text = PersonDetails.peronCourse;
      _selectedDropdownValue = PersonDetails.personDepartment;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        centerTitle: true,
        title: const Text(
          'Student Form',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        ),
        actions: [
          PopupMenuButton(
            color: Colors.blue.shade300,
            itemBuilder: (context) =>
                [PopupMenuItem(value: 1, child: Text('Delete',style: TextStyle(color: Colors.white),))],
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {
                print('Clicked Delete Button');
                _deleteDialogshow(context);
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(children: [
                  Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 70,
                    width: 280,
                    child: TextFormField(
                      controller: _studentNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: ' Name',
                          hintText: 'Enter Name'),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 70,
                    width: 280,
                    child: TextFormField(
                      controller: _studentMobileController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Mobile No',
                          hintText: 'Enter Student Mobile No'),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mail_lock_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 70,
                      width: 280,
                      child: TextFormField(
                        controller: _studentGmailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Student Email Id',
                            hintText: 'Enter Student Email Id'),
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
                      height: 70,
                      width: 280,
                      child: TextFormField(
                        controller: _studentCourseController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Course',
                            hintText: 'Enter Your Course'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
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
                        items: <String>['BCA', 'MCA', "Bsc", "BE(csc)"]
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
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                    onPressed: () {
                      print('--------------->Modify Button Clicked');
                      _update();
                    },
                    child: const Text('Modify',style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _update() async {
    print('--------------->Update Method');
    print('--------------->Student Name :${_studentNameController.text}');
    print(
        '--------------->Student Mobile No :${_studentMobileController.text}');
    print('--------------->Student EmailId :${_studentGmailController.text}');
    print('--------------->Student Course :${_studentCourseController.text}');
    print('--------------->Student Department :${_selectedDropdownValue}');
    print('--------------->Selected Id :$selectRecordId');

    //Store Data in Table Using Map
    Map<String, dynamic> row = {
      Helperdb.Id: selectRecordId,
      Helperdb.Name: _studentNameController.text,
      Helperdb.Mobile: _studentMobileController.text,
      Helperdb.Gmail: _studentGmailController.text,
      Helperdb.Course: _studentCourseController.text,
      Helperdb.Department: _selectedDropdownValue,
    };

    final result = await databasehelper.updatepersondetails(row);
    debugPrint('--------------->Update Row Id :$result');

    //This Conditions if the record is avaiable If condition is true else false
    if (result > 0) {
      _showSuccessSnackBar(context, 'Updated'); //Method Call
      setState(() {
          Navigator.of(context)
           .push(MaterialPageRoute(builder: (context) =>Homepage()));
      });
    }
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  _deleteDialogshow(BuildContext context) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                  onPressed: () {
                    print('--------------->Cancel Button Clicked');
                    Navigator.pop(context);
                  },
                  child: Text('Cancel',style: TextStyle(color: Colors.white),)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  onPressed: () {
                    print('--------------->Delete Method Clicked');
                    _delete();
                  },
                  child: Text('Delete',style: TextStyle(color: Colors.white),)),
            ],
            title: Text('Are you sure want to be delect?'),
          );
        });
  }

  //Delete Method
  void _delete() async {
    print('--------------->Delete Method');
    print('--------------->Selected Id :$selectRecordId');

    final res = await databasehelper.delectpersondetails(selectRecordId);
    debugPrint('---------------->Deleted Row Id :$res');

    if (res > 0) {
      _showSuccessSnackBar(context, "Deleted");
      setState(() {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Homepage(),));
      });
    }
  }
}
