import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
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
                      decoration: InputDecoration(hintText: "Name"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(hintText: "Phone Number"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(hintText: "Address"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(hintText: "Description"),
                    ),
                    SizedBox(height: 20),
                    CupertinoButton(
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.secondary,
                        child: Text(
                          "Submit",
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
