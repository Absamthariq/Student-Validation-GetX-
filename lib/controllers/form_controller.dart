
import 'package:get/get.dart';

class Formcontroller extends GetxController {  

  int selectedValue = 0;

  radioButtonchanging(int value){
     selectedValue = value;
     update();
  }
}