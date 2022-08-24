class UserFields {
  static final String srno = 'Sr no';
  static final String name = 'Name';
  static final String phoneNo = 'Phone No.';
  static final String address = 'Address';
  static final String description = 'Description';

  static List<String> getfields() =>
      [srno, name, phoneNo, address, description];
}

class User {
  final int? srno;
  final String name;
  final String phoneNo;
  final String address;
  final String description;

  User(
      {this.srno,
      required this.name,
      required this.phoneNo,
      required this.address,
      required this.description});

  Map<String, dynamic> toJson() => {
        UserFields.srno: srno,
        UserFields.name: name,
        UserFields.phoneNo: phoneNo,
        UserFields.address: address,
        UserFields.description: description,
      };
}
