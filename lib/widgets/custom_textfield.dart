import 'package:buy_it/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   String? hint;
   IconData? icon;
   Function? onClick;

  String? _errorMessage(String str) {
    switch (hint) {
      case 'Enter Your Name' : return 'Name Is Empty';
      case 'Enter Your Email' : return 'Email Is Empty';
      case 'Enter Your Password' : return 'Password Is Empty';
    }
  }

  CustomTextField({required this.onClick,required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(hint!) ;
          }
        },
        onSaved: onClick!()!,
        obscureText: hint=='Enter Your Password'? true : false,
        cursorColor: KMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: KMainColor,
          ),
          filled: true,
          fillColor: KTextColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
