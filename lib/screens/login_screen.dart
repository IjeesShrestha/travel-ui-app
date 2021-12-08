import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//adding a form key
  final _formKey = GlobalKey<FormState>();
//adding text editing controllers for the email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
//firebase call
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      style: TextStyle(
        color: Colors.black87,
        fontSize: 12.sp,
        letterSpacing: 0.1,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      style: TextStyle(
        color: Colors.black87,
        fontSize: 12.sp,
        letterSpacing: 0.1,
      ),
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final logInButton = Material(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          color: Theme.of(context).primaryColor,
          elevation: 5,
          minWidth: 100.w,
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 25),
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, bottom: 2.h),
                        child: SizedBox(
                          height: 22.h,
                          width: 90.w,
                          child: const Image(
                            image: AssetImage('assets/images/logo.jpg'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      emailField,
                      SizedBox(
                        height: 3.h,
                      ),
                      passwordField,
                      SizedBox(
                        height: 3.h,
                      ),
                      logInButton,
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/registration_screen',
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacementNamed('/'),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: 'Signin Error');
      });
    }
  }
}
