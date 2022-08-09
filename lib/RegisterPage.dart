import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                    Container(
                      height: 200,
                      width: 200,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          "assets/eye.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(hintText: "Name"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(hintText: "Shop Name"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(hintText: "Address"),
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
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
