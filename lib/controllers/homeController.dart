import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_details/screens/model/student_model.dart';

class StudentControllers extends GetxController {
  final box = Hive.box<StudentModel>(boxName);
  RxList<StudentModel> allStudents = <StudentModel>[].obs;

  getStudents() {
    allStudents.value = box.values.toList();
}

deleteStudents(int index){
  box.deleteAt(index);
  getStudents();
}


  @override
  void onInit() {
    getStudents();
    // TODO: implement onInit
    super.onInit();
  }
}


