import 'package:flutter/material.dart';
import 'package:news_prism/access/login.dart';

import '../home.dart';
import '../widgets/mytextfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFBF1D3),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome,",
                          style: TextStyle(
                            fontFamily: 'FaunaOne',
                            color: Color(0xFF0A2647),
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Create a new account",
                          style: TextStyle(
                            fontFamily: 'FaunaOne',
                            color: Color(0xFF0A2647).withOpacity(0.6),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Form(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 45, 0, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextField(
                              hintText: "Enter your name here",
                              labelText: "Full Name",
                              eyecon: false,
                              leading: Icons.person,
                              inv: false,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            MyTextField(
                              hintText: "e.g. abc@gmail.com",
                              labelText: "E-Mail",
                              eyecon: false,
                              leading: Icons.email,
                              inv: false,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            MyTextField(
                              hintText: "At least 8 characters",
                              labelText: "Password",
                              eyecon: true,
                              leading: Icons.password,
                              inv: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              hintText: "Password again",
                              labelText: "Confirm Password",
                              eyecon: true,
                              leading: Icons.password,
                              inv: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF0A2647),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  //edited later
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                },
                                child: Text(
                                  "SIGNUP",
                                  style: TextStyle(
                                    fontFamily: 'FaunaOne',
                                    color: Color(0xFFFBF1D3),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "OR",
                                    style: TextStyle(
                                      fontFamily: 'FaunaOne',
                                      color: Color(0xFF0A2647),
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        side: BorderSide(
                                          color: Color(0xFF0A2647),
                                          width: 2,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      icon: Image(
                                        image: AssetImage('images/google.png'),
                                        width: 20.0,
                                      ),
                                      onPressed: () {},
                                      label: Text(
                                        "  Login with Google",
                                        style: TextStyle(
                                          fontFamily: 'FaunaOne',
                                          color: Color(0xFF0A2647),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: Text.rich(
                                      TextSpan(
                                        text: "Already have an Account?  ",
                                        style: TextStyle(
                                          fontFamily: 'FaunaOne',
                                          color: Color(0xFF0A2647)
                                              .withOpacity(0.8),
                                          fontSize: 15,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Login",
                                            style: TextStyle(
                                              fontFamily: 'FaunaOne',
                                              color: Color(0xFF0A2647),
                                              fontSize: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
