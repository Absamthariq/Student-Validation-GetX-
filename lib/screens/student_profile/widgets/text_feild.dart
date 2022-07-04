import 'package:flutter/material.dart';

class TextFeild extends StatelessWidget {
  const TextFeild({Key? key, required this.title, required this.name}) : super(key: key);
final String title;
final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          "$title :",
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 8),
         Text(name,
            style:  const TextStyle(
              fontSize: 20,
            )),
        const Divider(
          height: 15,
          thickness: 1.2,
          
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
