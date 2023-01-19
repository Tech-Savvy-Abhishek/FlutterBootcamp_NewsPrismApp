import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool eyecon;
  final IconData leading;
  final bool inv;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.eyecon,
    required this.leading,
    required this.inv,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: inv
          ? TextStyle(color: Colors.white, fontSize: 20)
          : TextStyle(color: Colors.black, fontSize: 20),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: inv
              ? BorderSide(color: Colors.white)
              : BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(
          leading,
          color: inv ? Color(0xFFFBF1D3) : Color(0xFF0A2647),
        ),
        hintStyle: TextStyle(
          color: inv
              ? Color(0xFFFBF1D3).withOpacity(0.5)
              : Color(0xFF0A2647).withOpacity(0.5),
          fontSize: 20,
        ),
        labelStyle: TextStyle(
          color: inv ? Color(0xFFFBF1D3) : Color(0xFF0A2647),
          fontSize: 20,
        ),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: eyecon
            ? IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: inv ? Color(0xFFFBF1D3) : Color(0xFF0A2647),
                ),
                onPressed: () {},
              )
            : null,
      ),
    );
  }
}
