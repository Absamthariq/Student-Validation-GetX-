import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_details/constants/const.dart';
import 'package:student_details/controllers/homeController.dart';
import 'package:student_details/screens/add_new_student.dart/add_form.dart';
import 'package:student_details/screens/edit_scren/edit_profile.dart';
import 'package:student_details/screens/model/student_model.dart';
import 'package:student_details/screens/student_list/student_list_page.dart';
import 'package:student_details/screens/student_profile/widgets/text_feild.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile({
    Key? key,
    // required this.student_details,
    required this.index,
  }) : super(key: key);
  int index;
  // Map student_details = {};

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  Box studentBox = Hive.box<StudentModel>(boxName);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // StudentModel studentModel = studentBox.getAt(widget.index);

   StudentControllers studentControllers = Get.find<StudentControllers>();

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Profile'),
        backgroundColor: primaryColor,
      ),
      body: Obx(
     () {
          
      StudentModel studentModel =    studentControllers.allStudents[widget.index];

          return Column(
            children: [
              Container(
                color: primaryColor,
                height: 180,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: studentModel.image != null
                          ? CircleAvatar(
                              radius: 65,
                              // backgroundColor: Colors.black,
                              backgroundImage: FileImage(File(studentModel.image)),
                            )
                          : const CircleAvatar(
                              radius: 65,
                              backgroundImage: AssetImage(
                                  "assets/contact-dummy_landscape_964x656.jpg"),
                            ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${studentModel.name} ${studentModel.lastName}',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(2)),
                          height: 20,
                          width: 50,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Age: ${studentModel.age}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[50], borderRadius: circularRadiusTop50),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListView(
                      children: [
                        const SizedBox(height: 30),
                        TextFeild(title: 'Email Address', name: studentModel.email),
                        TextFeild(title: 'Sex', name: studentModel.sex),
                        TextFeild(title: 'Date of Birth', name: studentModel.dob),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddStudentForm(
                                          student: studentModel,
                                          isEditing: true,
                                          index: widget.index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('Edit')),
                            ),
                            Spacer(),
                            SizedBox(
                              height: 40,
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent,
                                    textStyle: const TextStyle(fontSize: 15)),
                                onPressed: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (ctx1) => AlertDialog(
                                      title: Text('Delete Student'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancel')),
                                        TextButton(
                                          onPressed: () {
                                            studentControllers
                                                .deleteStudents(widget.index);

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  '${studentModel.name} Deleted successfully',
                                                ),
                                                backgroundColor: Colors.redAccent,
                                                behavior: SnackBarBehavior.floating,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                elevation: 10.0,
                                              ),
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => StudentList(),
                                              ),
                                            );
                                          },
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Delete Profile'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
