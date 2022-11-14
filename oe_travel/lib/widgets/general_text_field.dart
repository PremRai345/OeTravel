import 'package:flutter/material.dart';

class GeneralTextField extends StatefulWidget {
  const GeneralTextField(
      {required this.title,
      required this.textInputType,
      required this.textInputAction,
      required this.validate,
      required this.controller,
      required this.onFieldSumitted,
      this.icon, //optional to select icon in general text field
      Key? key})
      : super(key: key);

  final String title;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validate;
  final TextEditingController controller;
  final void Function(String)? onFieldSumitted;
  final IconData? icon; // Option to select icon in general text field
  @override
  State<GeneralTextField> createState() => _GeneralTextFieldState();
}

class _GeneralTextFieldState extends State<GeneralTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      validator: widget.validate,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.title,
        hintText: "Enter your ${widget.title}",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(widget.icon),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 41, vertical: 20),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 196, 191, 191),
            width: 1,
          ),
          gapPadding: 10,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 196, 191, 191),
            width: 1,
          ),
          gapPadding: 10,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
          gapPadding: 10,
        ),
      ),
      onFieldSubmitted: widget.onFieldSumitted,
    );
  }
}
