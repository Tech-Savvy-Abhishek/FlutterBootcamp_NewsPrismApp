import 'package:flutter/material.dart';
import 'package:news_prism/access/signup.dart';
import 'package:news_prism/data/constants.dart';
import 'package:news_prism/home.dart';
import 'package:news_prism/widgets/mytextfield.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A2647),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "NEWS PRISM",
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      color: Color(0xFFFBF1D3),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back,",
                        style: TextStyle(
                          fontFamily: 'FaunaOne',
                          color: Color(0xFFFBF1D3),
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
                        "Sign in to continue",
                        style: TextStyle(
                          fontFamily: 'FaunaOne',
                          color: Color(0xFFFBF1D3).withOpacity(0.6),
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
                            hintText: "e.g. abc@gmail.com",
                            labelText: "E-Mail",
                            eyecon: false,
                            leading: Icons.email,
                            inv: true,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          MyTextField(
                            hintText: "At least 8 characters",
                            labelText: "Password",
                            eyecon: true,
                            leading: Icons.password,
                            inv: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontFamily: 'FaunaOne',
                                  fontSize: 18,
                                  color: Color(0xFFFBF1D3),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ), //SizedBox
                              Text(
                                'Keep me Signed in',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: chinaIvory,
                                    fontFamily: 'FaunaOne'),
                              ), //Text
                              SizedBox(width: 10), //SizedBox

                              Transform.scale(
                                scale: 1.4,
                                child: Checkbox(
                                  side: BorderSide(
                                    color: chinaIvory,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  value: this.value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value;
                                    });
                                  },
                                ),
                              ), //Checkbox
                            ], //<Widget>[]
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFBF1D3),
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
                                "LOGIN",
                                style: TextStyle(
                                  fontFamily: 'FaunaOne',
                                  color: Color(0xFF0A2647),
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
                                    color: Color(0xFFFBF1D3),
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
                                        color: Color(0xFFFBF1D3),
                                        width: 2,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                        color: Color(0xFFFBF1D3),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      text: "Don;t have an account yet?  ",
                                      style: TextStyle(
                                        fontFamily: 'FaunaOne',
                                        color:
                                            Color(0xFFFBF1D3).withOpacity(0.6),
                                        fontSize: 15,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Sign Up",
                                          style: TextStyle(
                                            fontFamily: 'FaunaOne',
                                            color: Color(0xFFFBF1D3),
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
      ),
    );
  }
}
