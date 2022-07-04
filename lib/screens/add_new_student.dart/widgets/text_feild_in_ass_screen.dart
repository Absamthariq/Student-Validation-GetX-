import 'package:flutter/material.dart';

class AddScreenTextField extends StatelessWidget {
  AddScreenTextField({
    Key? key,
    required this.title,
    required this.validator,
    required this.inputType,
    required this.controller,
  }) : super(key: key);
  final String title;
  final FormFieldValidator validator;
  final TextInputType inputType;
  final TextEditingController controller;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: title,
        labelStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }
}
