// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:realeye_india/models/addUserField.dart';
import 'package:realeye_india/models/sheetModels.dart';

class UserFormWidget extends StatefulWidget {
  final User? user;
  final ValueChanged<User> onSavedUser;
  const UserFormWidget({Key? key, required this.onSavedUser, this.user})
      : super(key: key);

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
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

  @override
  void didUpdateWidget(covariant UserFormWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    initUser();
  }

  void initUser() {
    final name = widget.user == null ? '' : widget.user!.name;
    final phoneNo = widget.user == null ? '' : widget.user!.phoneNo;
    final address = widget.user == null ? '' : widget.user!.address;
    final description = widget.user == null ? '' : widget.user!.description;

    setState(() {
      controllerName = TextEditingController(text: name);
      controllerPhoneno = TextEditingController(text: phoneNo);
      controllerAddress = TextEditingController(text: address);
      controllerDescription = TextEditingController(text: description);
    });
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
                        keyboardType: TextInputType.number,
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
                            final form = formkey.currentState!;
                            final isvalid = form.validate();
                            if (isvalid) {
                              final user = User(
                                  name: controllerName.text,
                                  phoneNo: controllerPhoneno.text,
                                  address: controllerAddress.text,
                                  description: controllerDescription.text);
                              widget.onSavedUser(user);
                            }
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
