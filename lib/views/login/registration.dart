import 'package:flutter/material.dart';
import 'package:myassigment/constants/colors.dart';
import 'package:myassigment/services/auth.dart';
import 'package:myassigment/views/home_screen.dart';
import 'package:myassigment/widgets/forms.dart';

class Registration extends StatefulWidget {
  static const routeName = '/registration';
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String name = '';
  String email = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset('assets/img/login.png'),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'User Registration',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            TextFormField(
                              onChanged: (value) =>
                                  setState(() => name = value),
                              decoration: Forms.textFromFieldDecoration(
                                  label: "Your name*", hint: "Enter your name"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name cannot be empty";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              onChanged: (value) =>
                                  setState(() => email = value),
                              decoration: Forms.textFromFieldDecoration(
                                  label: "Your email*",
                                  hint: "Enter your email"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email cannot be empty";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              onChanged: (value) =>
                                  setState(() => password = value),
                              decoration: Forms.textFromFieldDecoration(
                                  label: "Your password*",
                                  hint: "Enter your password"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  final user =
                                      EmailAndPassAuthentication.registration(
                                          email: email, password: password);
                                  if (user != null) {
                                    Navigator.pushNamed(
                                        context, HomeScreen.routeName);
                                  }
                                }
                              },
                              child: Forms.button(title: 'Submit', w: w),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
