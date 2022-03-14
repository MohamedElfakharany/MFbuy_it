import 'package:buy_it/screens/login_screen.dart';
import 'package:buy_it/services/auth.dart';
import 'package:buy_it/widgets/custom_logo.dart';
import 'package:buy_it/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUpScreen';

  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _email, _password;

  final GlobalKey<FormState> _SignupFormGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        key: _SignupFormGlobalKey,
        child: ListView(
          children: <Widget>[
            BuyitLogo(),
            SizedBox(
              height: height * 0.05,
            ),
            TextFormField(
              // onChanged: (String? val){
              //   setState(() {
              //     _email = val!;
              //   });
              // },
              cursorColor: KMainColor,
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                prefixIcon: Icon(
                  Icons.perm_identity,
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
            // CustomTextField(
            //   hint: 'Enter Your Name',
            //   icon: Icons.perm_identity,
            //   onClick: () {},
            // ),
            SizedBox(
              height: height * 0.01,
            ),
            TextFormField(
              onChanged: (String? val){
                setState(() {
                  _email = val!;
                });
              },
              cursorColor: KMainColor,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                prefixIcon: Icon(
                  Icons.email,
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
            // CustomTextField(
            //   hint: 'Enter Your Email',
            //   icon: Icons.email,
            //   onClick: (value) {
            //     _email = value!;
            //   },
            // ),
            SizedBox(
              height: height * 0.01,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (String? val){
                setState(() {
                  _password = val!;
                });
              },
              cursorColor: KMainColor,
              decoration: InputDecoration(
                hintText: 'Enter Your Password',
                prefixIcon: Icon(
                  Icons.lock,
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
            // CustomTextField(
            //   hint: 'Enter Your Password',
            //   icon: Icons.lock,
            //   onClick: (value) {
            //     _password = value!;
            //   },
            // ),
            SizedBox(
              height: height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (_SignupFormGlobalKey.currentState!.validate()) {
                    _SignupFormGlobalKey.currentState!.save();
                    print(_email);
                    print(_password);
                    Auth.signUP(_email!, _password!);
                  }
                },
                color: Colors.black,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do have an Account   ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
