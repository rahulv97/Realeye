import 'package:flutter/cupertino.dart';
import 'package:gsheets/gsheets.dart';
import 'package:realeye_india/models/addUserField.dart';

class UserSheetsApi {
  static const _credentials = r''' 
  
 {
  "type": "service_account",
  "project_id": "userrecord",
  "private_key_id": "528f83ac2012deceba2c68b798613e791d97eec9",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC9Nw+lxgqRkqCL\naCe/KrAquRITptl00Zbg7GLKpUen/StQgVxosQifPX7TngGNZ2oFriApIkFXhXut\ny62ud0m56c4sMqgNcOWGCP35GsuzMVGRiiERsW0r+RpB0va9MBb9J55DbUZl6B/l\nYjiMU5TI7VCUgpVWDikpmuuNo+pnyzWSvHRTRHtYXvq3Ambys5Qmqt8MM82oP4S7\njVAtTh8r/SQoM7/uBF1jJc4mGksfAXs2eqktR7SQK/nGQMPOymcbDD6nFzo6oRQt\nNb4nUChap41zYbci9342svTBbN0iIodWJnzUQjcui9A4xCcUTlMqvcYARQJdDHFj\nsGPWxJjvAgMBAAECggEAHl313u8XxyE3Luh6aI3bVB/7rLe8cqkog9SsTkWUaHuT\nNgps4Eh5T8U405GqQh10wJCfjLp4rik4Hj5wE24FoRbLBgDjQ7T4wTg0OoR4aLvj\nkW4PvJ0zHjmOYz4OZ3KOXfa7yaqB/9zvMYs/9BV97XlY01zZxsPjC1BXuZWzCxEk\nuG4ANOhVhBmfOfM3vuKKnOaUr0UG/C+4jnLNin5thBgxqTZqGZhF8R+UxrsqwDU6\nW/rnKgT4Bu4udaVIX5BPI52gTdjU1q2Ki1TPf4jj0dY+jv4N+jCY9c5eR6yFHPBP\ny4U4/2ToA2anJCJaVcnR9kl8ZgVyKTu7kRHIRRViYQKBgQD7AIo2ZXm9iu3fl2nt\nNK+Jq79K7G3VZ9J9WHwDkqGJobdk66SpnBK1f3ydWASvVWxxxs3i6+n+Ob8XKxBr\nOJWb0LDPxLRjZzcDXgCjn7wMzHlLYXy65KW5cy1k0kEHlzNUFg8w/ow9zQK0EDep\n/yZfWDhHaDjcJqQV33of+vHAxwKBgQDA+5FLolPCzkpTW4IKzTJMNaugDdFnKQsF\nYxVKhzQazxxgU/iv/2zGYG9130TvxeIUv7hhd+5uov3Q18BJq6glGqI2rGw3qMND\ndmKMkyeSBWSGYmTKleDCBycGzlesngfD1Fc/QsC/Gvv6WzxBTVPE5MoQ1gTX0tzf\nzhKye9aOmQKBgGthNr/At8070zn1Z86f3Hz0Kbke3noOmYEgSqWopEziDzgwi1g4\nOdTFvoT9s7tiuysNluT+cjNddv+tX6/PHEn1hL7N8zIXZPSe0X0uh9+d1kJGaXr2\n+GMXABOC02kw6TeO3F7kdxC1VPO9gGLMkhj1/9Wko7ajHU1yNqfZznTfAoGAOIl7\nB62G3IuTOtiUQJXdJnaS0VE7B/3+PJXKpwr1OOV0asQvF2C9fWDDRsUibRyMH4gL\nfIKmV8NomMacjvi7SiODYoEhMy0+B4WnWYfDEASEbtpkrPU745w00smg5fFmVPjg\nlqf30AUXzUDtZjRBVm2wxT3uLUyZaPf2glPFiAECgYBD2ThytnnzFBLtsNsE/AzE\ne92AJTH4uW02Z+CzSjtebjTOKzC2nXYrmwPLOMpLWq7ZD0xfc0Od96m/LUKi3XNm\nVAhrPz0Pa9Bn36017iOe5KSTB//XsCAbOb7rkESo5jJ8ZzrQ65bHyHRcb0G8c9mK\nxJU1cvTIwSKsky11F3DQgA==\n-----END PRIVATE KEY-----\n",
  "client_email": "userrecord@userrecord.iam.gserviceaccount.com",
  "client_id": "102896468951089883962",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/userrecord%40userrecord.iam.gserviceaccount.com"
}

  
   ''';

  static final _spreadsheetId = '1IuF8EapS_Voevl6l3k09ZSdOPO2KIWP8PPoGWC8ZRXA';

  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'UserRecord');

      final firstRow = UserFields.getfields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init error $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return await spreadsheet.addWorksheet(title);
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;

    _userSheet!.values.map.appendRows(rowList);
  }
}
