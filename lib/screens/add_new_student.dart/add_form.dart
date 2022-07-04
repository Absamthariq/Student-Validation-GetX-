import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_details/constants/circularAvatar.dart';
import 'package:student_details/constants/const.dart';
import 'package:student_details/controllers/form_controller.dart';
import 'package:student_details/controllers/homeController.dart';
import 'package:student_details/screens/add_new_student.dart/widgets/text_feild_in_ass_screen.dart';
import 'package:student_details/screens/model/student_model.dart';

String? imagePath;
String? dateValue;
String? monthValue;
String? yearValue;

class AddStudentForm extends StatelessWidget {
  AddStudentForm({Key? key, this.isEditing = false, this.index, this.student})
      : super(key: key);
  bool isEditing;
  StudentModel? student;
  int? index;

  final _formKey = GlobalKey<FormState>();
  Box<StudentModel> studentBox = Hive.box<StudentModel>(boxName);

  final _nameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _ageController = TextEditingController();

  final _emailController = TextEditingController();

  // @override
  // void initState() {
  //   if (isEditing) {
  //     _nameController.text = student!.name;
  //     _lastNameController.text = student!.lastName;
  //     _ageController.text = student!.age;
  //     _emailController.text = student!.email;
  //     // selectedValue = int.parse(student!.sex);
  //     dateValue = student!.dob;
  //     monthValue = student!.dob;
  //     yearValue = student!.dob;
  //   }
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _lastNameController.dispose();
  //   _ageController.dispose();
  //   _emailController.dispose();
  //   imagePath;
  //   super.dispose();
  // }

  @override
  build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    StudentControllers studentControllers = Get.find<StudentControllers>();
    Formcontroller formcontroller = Get.put(Formcontroller());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: GetBuilder<Formcontroller>(dispose: (_) {
              _nameController.dispose();
              _lastNameController.dispose();
              _ageController.dispose();
              _emailController.dispose();
              imagePath = null;
            }, initState: (state) {
              if (isEditing) {
                _nameController.text = student!.name;
                _lastNameController.text = student!.lastName;
                _ageController.text = student!.age;
                _emailController.text = student!.email;
                // selectedValue = int.parse(student!.sex);
                dateValue = student!.dob;
                monthValue = student!.dob;
                yearValue = student!.dob;
              }
            }, builder: (_) {
              return Column(
                children: [
                  Container(
                    color: primaryColor,
                    height: 230,
                    width: double.infinity,
                    child: CircularProfile(),
                  ),
                  const SizedBox(height: 20),
                  //<<<<<< Name Feild >>>>>>>>
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 20,
                          child: nameFieild(),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          flex: 15,
                          child: lastName(),
                        ),
                      ],
                    ),
                  ),
                  height10,
                  //<<<<<<< Email Feild >>>>>>>
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 30,
                          child: emailField(),
                        ),
                      ],
                    ),
                  ),
                  height10,

                  //<<<<<<< Radio and Age Feild >>>>>>
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        // color: Colors.green,
                        child: GenderRadio(),
                      ),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ageField(),
                        ),
                      ),
                    ],
                  ),
                  height20,
                  //<<<<<<< Date and Birth Feild >>>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: dateAndMonth(),
                  ),
                  height20,
                  SizedBox(
                    height: 45,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            formcontroller.selectedValue != 0) {
                          StudentModel newStudentData = StudentModel(
                            name: _nameController.text,
                            lastName: _lastNameController.text,
                            email: _emailController.text,
                            age: int.parse(_ageController.text).toString(),
                            sex: formcontroller.selectedValue == 1
                                ? "Male"
                                : "Female",
                            dob: '$dateValue/$monthValue/$yearValue',
                            image: imagePath,
                          );

                          if (isEditing) {
                            studentBox.putAt(index!, newStudentData);
                          } else {
                            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*Adding_to_Box*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
                            studentBox.add(newStudentData);
                          }

                          studentControllers.getStudents();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Student added successfully',
                              ),
                              backgroundColor: Colors.blueAccent,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 6.0,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        isEditing ? "Update Student" : " Add Student",
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          textStyle: const TextStyle(fontSize: 15)),
                    ),
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  GenderRadio() {
    return GetBuilder<Formcontroller>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Male',
            style: TextStyle(fontSize: 18),
          ),
          Transform.scale(
            scale: 1.3,
            child: Radio<int>(
              value: 1,
              groupValue: controller.selectedValue,
              onChanged: (value) {
                controller.radioButtonchanging(value!);
              },
            ),
          ),
          const Text(
            'Female',
            style: TextStyle(fontSize: 18),
          ),
          Transform.scale(
            scale: 1.3,
            child: Radio<int>(
              value: 2,
              groupValue: controller.selectedValue,
              onChanged: (value) {
                controller.radioButtonchanging(value!);
              },
            ),
          )
        ],
      );
    });
  }

  DropdownDatePicker dateAndMonth() {
    return DropdownDatePicker(
      boxDecoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      isFormValidator: true,
      onChangedDay: (date) => dateValue = date,
      onChangedMonth: (month) => monthValue = month,
      onChangedYear: (year) => yearValue = year,
    );
  }

  AddScreenTextField ageField() {
    return AddScreenTextField(
      title: 'Age',
      inputType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty || value == null) {
          return "Required Field";
        } else if (value.length < 2 || value.length > 2) {
          return "Under age to join";
        } else if (int.parse(value) < 17 || int.parse(value) > 110) {
          return "Must be b/w 18 and Above";
        } else {
          return null;
        }
      },
      controller: _ageController,
    );
  }

  AddScreenTextField emailField() {
    return AddScreenTextField(
      title: 'Email Address',
      inputType: TextInputType.emailAddress,
      validator: (value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = RegExp(pattern.toString());
        if (value.isEmpty || value == null) {
          return "Required Field";
        } else if (!regex.hasMatch(value)) {
          return "Enter a valid email";
        } else {
          return null;
        }
      },
      controller: _emailController,
    );
  }

  AddScreenTextField lastName() {
    return AddScreenTextField(
      title: 'Last Name',
      inputType: TextInputType.text,
      validator: (value) {
        String patttern = r'(^[a-z A-Z]+$)';
        RegExp regExp = RegExp(patttern.toString());
        if (value.length == 0) {
          return "Enter your Last name";
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid name';
        } else {
          return null;
        }
      },
      controller: _lastNameController,
    );
  }

  AddScreenTextField nameFieild() {
    return AddScreenTextField(
      title: 'Name',
      validator: (value) {
        String pattern = r'(^[a-z A-Z]+$)';
        RegExp regExp = RegExp(pattern.toString());
        if (value.length == 0) {
          return 'Enter Your Name';
        } else if (!regExp.hasMatch(value)) {
          return 'Please Enter a Valid Name';
        } else {
          return null;
        }
      },
      inputType: TextInputType.text,
      controller: _nameController,
    );
  }
}
