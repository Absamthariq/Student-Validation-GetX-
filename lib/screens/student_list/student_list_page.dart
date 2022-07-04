import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_details/constants/const.dart';
import 'package:student_details/controllers/homeController.dart';
import 'package:student_details/screens/add_new_student.dart/add_form.dart';
import 'package:student_details/screens/model/student_model.dart';
import 'package:student_details/screens/student_profile/student_profile.dart';

// ignore: must_be_immutable
class StudentList extends StatelessWidget {
  StudentList({Key? key}) : super(key: key);

  Box studentBox = Hive.box<StudentModel>(boxName);

  @override
  Widget build(BuildContext context) {
    StudentControllers studentControllers = Get.put(StudentControllers());

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0.8,
                backgroundColor: primaryColor,
                expandedHeight: 150,
                pinned: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddStudentForm(
                                    isEditing: false,
                                  )),
                        );
                      },
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Students',
                    style: GoogleFonts.roboto(
                        color: Colors.white70,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                  titlePadding: const EdgeInsetsDirectional.only(
                    start: 20,
                    bottom: 10,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child:
                    // ValueListenableBuilder(
                    //   valueListenable: studentBox.listenable(),
                    //   builder: (context, Box box, _) {

                    Obx(
                  () {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        StudentModel student = studentControllers.allStudents.value[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentProfile(
                                  index: index,
                                ),
                              ),
                            );
                          },
                          onLongPress: () {
                           studentControllers.deleteStudents(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${student.name} Deleted successfully',
                                ),
                                backgroundColor: Colors.redAccent,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                elevation: 10.0,
                              ),
                            );
                          },
                          leading: student.image != null
                              ? CircleAvatar(
                                  radius: 30,
                                  // backgroundColor: Colors.black,
                                  backgroundImage:
                                      FileImage(File(student.image)),
                                )
                              : const CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      "assets/contact-dummy_landscape_964x656.jpg"),
                                ),
                          title: Text(student.name),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: studentControllers.allStudents.value.length,
                      shrinkWrap: true,
                      primary: false,
                    );
                  },
                ),

                //   },
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
