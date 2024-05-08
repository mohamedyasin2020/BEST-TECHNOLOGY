import 'package:flutter/material.dart';
import 'package:flutter_database/database_helper.dart';
import 'package:flutter_database/modify_page.dart';
import 'package:flutter_database/person_model.dart';
import 'package:flutter_database/registor_page.dart';
import 'main.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Persondetailsmodel> _Persondetailslist = <Persondetailsmodel>[];

  @override
  void initState() {
    super.initState();
    print("------>initState");
    getAllPersondetails();
  }

  getAllPersondetails() async {
    print('---------->getAllPersondetails');

    final PersonDetailRecords = await databasehelper.getStudentRecord();

    PersonDetailRecords.forEach((row) {
      setState(() {
        print(row[Helperdb.Id]);
        print(row[Helperdb.Name]);
        print(row[Helperdb.Mobile]);
        print(row[Helperdb.Gmail]);

        var PersonModel = Persondetailsmodel(
          row[Helperdb.Id],
          row[Helperdb.Name],
          row[Helperdb.Mobile],
          row[Helperdb.Gmail],
          row[Helperdb.Course],
          row[Helperdb.Department],
        );

        _Persondetailslist.add(PersonModel);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: const Text(
            "Your Details",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: _Persondetailslist.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  print('------->List View Clicked');
                  print(_Persondetailslist[index].id);
                  print(_Persondetailslist[index].personName);
                  print(_Persondetailslist[index].personNo);
                  print(_Persondetailslist[index].personGmail);
                  print(_Persondetailslist[index].peronCourse);
                  print(_Persondetailslist[index].personDepartment);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Modify(),
                      settings: RouteSettings(
                        arguments: _Persondetailslist[index],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Container(
                    height: 120,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: _Persondetailslist[index].personName + "\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: _Persondetailslist[index].personNo + "\n",
                            ),
                            TextSpan(
                              text:_Persondetailslist[index].personGmail + "\n",
                            ),
                            TextSpan(
                              text:_Persondetailslist[index].peronCourse + "\n",
                            ),
                            TextSpan(
                              text:_Persondetailslist[index].personDepartment,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            print("Floating action button is pressed");
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Registor()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
