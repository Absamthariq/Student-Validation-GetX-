import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';
@HiveType(typeId: 0)
class StudentModel{
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String age;
  @HiveField(4)
  final String sex;
  @HiveField(5)
  final String dob;
  @HiveField(6)
  final image;
  @HiveField(7)
  final String lastName;

  StudentModel({
    required this.name,
    required this.email,
    required this.age,
    required this.sex,
    required this.dob,
    required this.lastName,
     this.image
    
  });
}
const String boxName = "student";