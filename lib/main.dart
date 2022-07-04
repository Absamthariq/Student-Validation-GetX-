
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_details/constants/const.dart';
import 'package:student_details/screens/model/student_model.dart';
import 'package:student_details/screens/student_list/student_list_page.dart';

Future <void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(StudentModelAdapter());
  await Hive.openBox<StudentModel>(boxName);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(color:primaryColor),
        fontFamily: GoogleFonts.inter().toString()
      ),
      home:  StudentList(),
    );
  }
}

