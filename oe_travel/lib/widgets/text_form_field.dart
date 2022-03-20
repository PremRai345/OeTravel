import 'package:flutter/material.dart';


class InputTextField extends StatefulWidget {
  const InputTextField(
      {required this.title,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      required this.validate,
      this.isObscure = false,
      required this.onFieldSubmitted,
       this.prefixIcon,
       this.iconData,
       
      Key? key})
      : super(key: key);

  final String title;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool isObscure;
  final Icon? prefixIcon;
  final IconData? iconData;
  final String? Function(String?)? validate;
  final Function(String)? onFieldSubmitted;
  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  late bool toHide;

  void initState() {
    // TODO: implement initState
    super.initState();
    toHide = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      obscureText: toHide,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.title,
        hintStyle: Theme.of(context).textTheme.subtitle1,
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: toHide
                    ? Icon(Icons.visibility_outlined)
                    : Icon(Icons.visibility_off_outlined),
                onPressed: () {
                  setState(() {
                    toHide = !toHide;
                  });
                },
              )
            : null,
      ),
      validator: widget.validate,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
