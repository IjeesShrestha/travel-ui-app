import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// Create a Form widget.
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() {
    return SignUpState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SignUpState extends State<SignUp> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,

  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    //print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h, left: 3.w, bottom: 3.h),
              child: Text(
                'Log in / Sign Up',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      onChanged: (text) {
                        //print('First text field: $text');
                      },
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your First Name',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      onChanged: (text) {
                        //print('First text field: $text');
                      },
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Last Name',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 40.w,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
