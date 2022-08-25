import 'package:flutter/material.dart';
import 'package:realeye_india/models/addUserField.dart';

import 'package:realeye_india/models/sheetModels.dart';
import 'package:realeye_india/models/userwidget.dart';

class AddNew extends StatefulWidget {
  const AddNew({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  // User? user;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   getUsers();
  // }

  // Future getUsers() async {
  //   final user = await UserSheetsApi.getBySrno(1);
  //   print("local" + "${user?.toJson()}");
  //   setState(() {
  //     this.user = user;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: UserFormWidget(
                // user: users.isEmpty ? null : users[index],
                onSavedUser: (user) async {
                  final srno = await UserSheetsApi.getRowCount() + 1;
                  final newUser = user.copy(srno: srno);
                  await UserSheetsApi.insert([newUser.toJson()]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
