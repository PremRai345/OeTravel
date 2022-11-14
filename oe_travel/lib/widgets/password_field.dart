import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {required this.title,
      required this.textInputType,
      required this.textInputAction,
      required this.validate,
      required this.controller,
      this.isObscure = false,
      this.icon, // optional to select icon
      Key? key})
      : super(key: key);

  final String title;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validate;
  final TextEditingController controller;
  final bool isObscure;
  final IconData? icon; //Option to select icon

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  // late keyword will tell when widget is rendered that value is comed already
  late bool toHide;

  @override
  void initState() {
    super.initState();

    toHide = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: toHide,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      validator: widget.validate,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  toHide
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color.fromARGB(255, 196, 191, 191),
                ),
                onPressed: () {
                  setState(() {
                    toHide = !toHide;
                  });
                },
              )
            : null,
        labelText: widget.title,
        hintText: "Enter your ${widget.title}",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
    );
  }
}
