import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:recipe_app/services/auth_service.dart';
import 'package:status_alert/status_alert.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  GlobalKey<FormState> _loginformkey = GlobalKey();

  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: [
            build_title(),
            Form(
              key: _loginformkey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: 'emilys',
                    decoration: InputDecoration(
                      hintText: "usesrname",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a username";
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                  TextFormField(
                    initialValue: 'emilyspass',
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "password",
                    ),
                    validator: (value) {
                      if (value == null || value.length < 5) {
                        return "Enter a valid password";
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_loginformkey.currentState!.validate()) {
                  _loginformkey.currentState!.save();

                  bool result = await authservice().login(
                    username!,
                    password!,
                  );
                  print(result);

                  if (result) {
                  } else {
                    StatusAlert.show(context,
                        duration: Duration(seconds: 2),
                        title: "Login failed",
                        subtitle: "Please try again.",
                        configuration:
                            const IconConfiguration(icon: Icons.error),
                        maxWidth: 280);
                  }
                }
              },
              child: Text("submit"),
            )
          ],
        ),
      ),
    );
  }
}

Widget build_title() {
  return Center(
    child: Text("recipe book"),
  );
}