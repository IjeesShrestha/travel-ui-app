import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_ui_app/models/user_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //firebase
  final _auth = FirebaseAuth.instance;
  //form key

  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      style: TextStyle(
        color: Colors.black87,
        fontSize: 12.sp,
        letterSpacing: 0.1,
      ),
      autofocus: false,
      validator: (value) {
        RegExp regex = RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter a Valid First Name (Min. 2 Character)");
        }
      },
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'First Name',
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
        hintText: 'First Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    final secondNameField = TextFormField(
      style: TextStyle(
        color: Colors.black87,
        fontSize: 12.sp,
        letterSpacing: 0.1,
      ),
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Last Name cannot be empty");
        }
        return null;
      },
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Last Name',
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
        hintText: 'Last Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    final emailField = TextFormField(
      style: TextStyle(
        color: Colors.black87,
        fontSize: 12.sp,
        letterSpacing: 0.1,
      ),
      autofocus: false,
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
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    final passwordField = TextFormField(
      style: TextStyle(
        color: Colors.black87,
        fontSize: 12.sp,
        letterSpacing: 0.1,
      ),
      autofocus: false,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 10.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    final confirmPasswordField = TextFormField(
      style: TextStyle(
        color: Colors.black87,
        fontSize: 12.sp,
        letterSpacing: 0.1,
      ),
      autofocus: false,
      validator: (value) {
        if (confirmPasswordEditingController.text.length < 6 &&
            passwordEditingController.text !=
                confirmPasswordEditingController.text) {
          return ("Passwords do not match");
        }
        return null;
      },
      controller: confirmPasswordEditingController,
      obscureText: true,
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
        hintText: 'Confirm Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final signUPButton = Material(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          color: Theme.of(context).primaryColor,
          elevation: 5,
          minWidth: 100.w,
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 25),
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            'Sign Up',
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: Theme.of(context).primaryColor,
            iconSize: 29.sp,
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
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
                      firstNameField,
                      SizedBox(
                        height: 3.h,
                      ),
                      secondNameField,
                      SizedBox(
                        height: 3.h,
                      ),
                      emailField,
                      SizedBox(
                        height: 3.h,
                      ),
                      passwordField,
                      SizedBox(
                        height: 3.h,
                      ),
                      confirmPasswordField,
                      SizedBox(
                        height: 3.h,
                      ),
                      signUPButton,
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    //writing all values
    userModel.email = user!.email;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    userModel.uid = user.uid;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully.");
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/login_screen', (Route<dynamic> route) => false);
  }
}
