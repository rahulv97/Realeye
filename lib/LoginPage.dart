import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "REALEYE",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    SizedBox(height: 20),
                    CupertinoButton(
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.secondary,
                        child: Text("Log In"))
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 16),
              ),
              CupertinoButton(
                onPressed: () {},
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
