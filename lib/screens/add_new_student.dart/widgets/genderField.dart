// import 'package:flutter/material.dart';
// import 'package:student_details/screens/add_new_student.dart/add_form.dart';

// class GenderRadio extends StatefulWidget {
//    GenderRadio({Key? key,required this.selectedValue}) : super(key: key);
// int selectedValue = 0;
//   @override
//   State<GenderRadio> createState() => _GenderRadioState();
// }



// class _GenderRadioState extends State<GenderRadio> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         const Text(
//           'Male',
//           style: TextStyle(fontSize: 18),
//         ),
//         Transform.scale(
//           scale: 1.3,
//           child: Radio<int>(
//             value: 1,
//             groupValue: selectedValue,
//             onChanged: (value) => setState(() => selectedValue = 1),
//           ),
//         ),
//         const Text(
//           'Female',
//           style: TextStyle(fontSize: 18),
//         ),
//         Transform.scale(
//           scale: 1.3,
//           child: Radio<int>(
//             value: 2,
//             groupValue: selectedValue,
//             onChanged: (value) => setState(() => selectedValue = 2),
//           ),
//         )
//       ],
//     );
//   }
// }
