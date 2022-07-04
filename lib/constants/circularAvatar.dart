import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_details/screens/add_new_student.dart/add_form.dart';



class CircularProfile extends StatelessWidget {
  CircularProfile({Key? key,}) : super(key: key);
 
  final ImagePicker imgpick = ImagePicker();
  Future pickImage() async {
    XFile? image = await imgpick.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);

    imagePath = imageTemporary.path;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            imagePath != null
                ? CircleAvatar(
                    radius: 90,
                    backgroundImage: FileImage(
                      File(imagePath.toString()),
                    ),
                  )
                : const CircleAvatar(
                    radius: 90,
                    backgroundImage:
                        AssetImage("assets/contact-dummy_landscape_964x656.jpg"),
                  ),
            Positioned(
              bottom: 5,
              right: 8,
              child: CircleAvatar(
                child: IconButton(
                    onPressed: () async {
                      print("picked............");
                      await pickImage();
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    )),
                radius: 25,
                backgroundColor: Colors.orangeAccent,
              ),
            )
          ],
        ),
      ],
    );
  }
}
