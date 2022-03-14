// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:buy_it/constants.dart';
import 'package:buy_it/screens/signup_screen.dart';
import 'package:buy_it/services/auth.dart';
import 'package:buy_it/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email, _password;
  bool loader = false;

  GlobalKey<FormState> _LoginFormGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        key: _LoginFormGlobalKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Container(
                height: MediaQuery.of(context).size.height * .2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/icons/buyicon.png'),
                      height: 100,
                      width: 100,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Text(
                        'Buy It',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            // CustomTextField(
            //   hint: 'Enter Your Email',
            //   icon: Icons.email,
            //   onClick: (String? value) {
            //     setState(() {
            //       _email = value!;
            //     });
            //   },
            // ),
            TextFormField(
              onChanged: (String? val) {
                setState(() {
                  _email = val!;
                });
              },
              cursorColor: KMainColor,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
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
            SizedBox(
              height: height * 0.01,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (String? val) {
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
            //   onClick: (String? value) {
            //     setState(() {
            //       _password = value!;
            //     });
            //   },
            //   hint: 'Enter Your Password',
            //   icon: Icons.lock,
            // ),
            SizedBox(
              height: height * 0.05,
            ),
            loader == false
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        setState(() {
                          loader = true ;
                        });
                        if (_LoginFormGlobalKey.currentState!.validate()) {
                          _LoginFormGlobalKey.currentState!.save();
                          print(_email);
                          print(_password);
                          Auth.Login(_email!, _password!).then((value) {
                            print(value.user!.uid);
                            setState(() {
                              loader = false ;
                            });
                          });
                        }
                      },
                      color: Colors.black,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Container(
                width: 50,
                height: 50,
                child: Center(child: CircularProgressIndicator())),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an Account   ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.id);
                  },
                  child: Text(
                    'Sign Up',
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
