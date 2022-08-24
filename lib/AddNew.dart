// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:realeye_india/models/addUserField.dart';
import 'package:realeye_india/models/sheetModels.dart';

class AddNew extends StatefulWidget {
  const AddNew({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final formkey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerPhoneno;
  late TextEditingController controllerAddress;
  late TextEditingController controllerDescription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUser();
  }

  void initUser() {
    controllerName = TextEditingController();
    controllerPhoneno = TextEditingController();
    controllerAddress = TextEditingController();
    controllerDescription = TextEditingController();
  }

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
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Text(
                        "REALEYE",
                        style: GoogleFonts.itim(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controllerName,
                        decoration: InputDecoration(hintText: "Name"),
                        validator: (value) => value != null && value.isEmpty
                            ? 'Enter Name'
                            : null,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controllerPhoneno,
                        decoration: InputDecoration(hintText: "Phone Number"),
                        validator: (value) => value != null && value.isEmpty
                            ? 'Enter Phone Number'
                            : null,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controllerAddress,
                        decoration: InputDecoration(hintText: "Address"),
                        validator: (value) => value != null && value.isEmpty
                            ? 'Enter Address'
                            : null,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controllerDescription,
                        decoration: InputDecoration(hintText: "Description"),
                        validator: (value) => value != null && value.isEmpty
                            ? 'Enter Description'
                            : null,
                      ),
                      SizedBox(height: 20),
                      CupertinoButton(
                          onPressed: () async {
                            final user = {
                              UserFields.srno: 1,
                              UserFields.name: controllerName.text,
                              UserFields.phoneNo: controllerPhoneno.text,
                              UserFields.address: controllerAddress.text,
                              UserFields.description:
                                  controllerDescription.text,
                            };
                            await UserSheetsApi.insert([user]);
                          },
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
      ),
    );
  }
}
