import 'dart:convert';

class UserFields {
  static final String srno = 'srno';
  static final String name = 'name';
  static final String phoneNo = 'phoneNo';
  static final String address = 'address';
  static final String description = 'description';

  static List<String> getfields() =>
      [srno, name, phoneNo, address, description];
}

class User {
  final int? srno;
  final String name;
  final String phoneNo;
  final String address;
  final String description;

  const User(
      {this.srno,
      required this.name,
      required this.phoneNo,
      required this.address,
      required this.description});

  User copy({
    int? srno,
    String? name,
    String? phoneNo,
    String? address,
    String? description,
  }) =>
      User(
        srno: srno ?? this.srno,
        name: name ?? this.name,
        phoneNo: phoneNo ?? this.phoneNo,
        address: address ?? this.address,
        description: description ?? this.description,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        srno: jsonDecode(json[UserFields.srno]),
        name: json[UserFields.name],
        phoneNo: json[UserFields.phoneNo],
        address: json[UserFields.address],
        description: json[UserFields.description],
      );

  Map<String, dynamic> toJson() => {
        UserFields.srno: srno,
        UserFields.name: name,
        UserFields.phoneNo: phoneNo,
        UserFields.address: address,
        UserFields.description: description,
      };
}
