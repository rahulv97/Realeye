import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CupertinoButton(
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Add New",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () {}),
                SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height - 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 50),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text("data")),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
