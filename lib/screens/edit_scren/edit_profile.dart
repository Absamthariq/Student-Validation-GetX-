// import 'package:flutter/material.dart';
// import 'package:student_details/constants/const.dart';
// import 'package:student_details/screens/edit_scren/widgets/text_editing_field.dart';

// class EditProfile extends StatelessWidget {
//   const EditProfile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: primaryColor,
//       appBar: AppBar(
//         elevation: 0,
//         title: Text('Edit Profile'),
//         centerTitle: true,
//         backgroundColor: primaryColor,
       
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: primaryColor,
//             height: 200,
//             width: double.infinity,
//             child: Center(
//               child: Column(
//                 children: [
//                   Stack(
//                     children: [
//                       const CircleAvatar(radius: 90),
//                       Positioned(
//                         bottom: 5,
//                         right: 8,
//                         child: CircleAvatar(
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 Icons.camera_alt_outlined,
//                                 color: Colors.white,
//                               )),
//                           radius: 25,
//                           backgroundColor: Colors.orangeAccent,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: Colors.grey[50], borderRadius: circularRadiusTop50),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: ListView(
//                   children:  const [
//                     SizedBox(height: 30),
//                     TextEditingFeild(title: 'Name'),
//                     TextEditingFeild(title: 'Last Name'),
//                     TextEditingFeild(title: 'Email Address'),
//                     TextEditingFeild(title: 'Sex'),
//                     TextEditingFeild(title: 'Age'),
//                     TextEditingFeild(title: 'Date of Birth'),
                  
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.save_alt_rounded),
//       ),
//     );
//   }
// }
