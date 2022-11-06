import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatefulWidget {
  final IconData? suffixIcon;
  final String? label;
  final String? hintText;
  final Function(String? str)? onSaved;
  final String? Function(String? str) validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? obscureText;
  final bool? isPassword;
  final TextEditingController controller;
  final List<TextInputFormatter>? formaters;
  final Widget? prefix;
  final InputDecoration? decoration;
  final Function(String str) onChanged;

  const CustomTextField({
    Key? key,
    this.suffixIcon,
    this.label,
    this.hintText,
    required this.onSaved,
    required this.onChanged,
    required this.validator,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.isPassword = false,
    required this.controller,
    this.formaters = const [],
    this.prefix,
    this.decoration
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText!;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      validator: widget.validator,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.formaters,
      obscureText: obscureText,
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      
      onChanged: widget.onChanged,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: (widget.decoration != null)
       ? widget.decoration :  InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(255, 255, 255, 1),
          prefixIcon: widget.prefix,
          border: OutlineInputBorder(
            gapPadding: 2,
            borderRadius: BorderRadius.circular(4),
          ),
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: obscureText
                      ? const Icon(Icons.lock_outline)
                      : const Icon(Icons.lock_open_outlined),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  })
              : Icon(widget.suffixIcon),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          labelText: widget.label),
    );
  }
}
