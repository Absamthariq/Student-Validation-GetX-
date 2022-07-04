import 'package:flutter/material.dart';

class TextEditingFeild extends StatelessWidget {
  const TextEditingFeild({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          
          decoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(color: Colors.grey[400]),
          ),
        ),
        const SizedBox(height: 15,)
      ],
    );
  }
}
