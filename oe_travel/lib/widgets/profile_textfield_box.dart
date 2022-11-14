import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oe_travel/widgets/general_text_field.dart';

class ProfileField extends StatefulWidget {
  const ProfileField({
    required this.title,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.validate,
    required this.onFieldSubmitted,
    this.isObscure = false,
    Key? key,
    this.maxLength,
    this.inputFormatter,
  }) : super(key: key);

  final String title;
  final TextEditingController controller;
  final int? maxLength;
  final bool isObscure;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final String? Function(String?)? validate;
  final void Function(String)? onFieldSubmitted;

  @override
  State<ProfileField> createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  late bool toHide;

  @override
  void initState() {
    super.initState();
    toHide = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      obscureText: toHide,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Enter your ${widget.title}",
        //Make filled color transparent
        filled: true,
        fillColor: Color.fromARGB(255, 223, 222, 222).withOpacity(0.5),
        counter: const SizedBox.shrink(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 41, vertical: 20),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 172, 171, 171),
            width: 1,
          ),
          gapPadding: 10,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 26, 160, 142),
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
      controller: widget.controller,
      inputFormatters: widget.inputFormatter,
      maxLength: widget.maxLength,
      validator: widget.validate,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
