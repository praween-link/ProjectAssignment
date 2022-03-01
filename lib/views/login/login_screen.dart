import 'package:flutter/material.dart';
import 'package:myassigment/constants/colors.dart';
import 'package:myassigment/services/auth.dart';
import 'package:myassigment/views/home_screen.dart';
import 'package:myassigment/views/login/registration.dart';
import 'package:myassigment/widgets/forms.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      'User Login',
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
                                  setState(() => email = value.trim()),
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
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (value) =>
                                  setState(() => email = value.trim()),
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
                                  final user = EmailAndPassAuthentication.sigIn(
                                      email: email, password: password);
                                  if (user != null) {
                                    Navigator.pushNamed(
                                        context, HomeScreen.routeName);
                                  }
                                }
                              },
                              child: Forms.button(title: 'Submit', w: w),
                            ),
                            const SizedBox(height: 20),
                            const Text('OR'),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () async {
                                final user =
                                    await GoogleFirebaseAuth.signInWithGoogle();
                                if (user != null) {
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  Navigator.pushNamed(
                                      context, HomeScreen.routeName);
                                }
                              },
                              child: Forms.button(
                                  title: 'Sign in with Google', w: w),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('- - - - -'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('If you are a new user than, '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Registration.routeName);
                          },
                          child: const Text(
                            'click to register',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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
