import 'dart:convert';

import 'package:http/http.dart' as http;
class Controller {
  dynamic apiurl = "https://stream.alkmal.com/api";
  bool isLoading = false;

  Future<dynamic> addVisitorVoice(
      {name,
        email,
        password,
      confirmPassword}) async {

    var mydata = {
      "name": '$name',
      "image": '$email',
      "voice": '$password',
      // "visitorName": '$visitorName',
      "email": '$email',
    };
    var res = await http.post(Uri.parse("$apiurl/voice"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: mydata);
    print("ggggggggggggg ${res}");

    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> Register({name,
        email,
        mobile,
        password,
        confirmPassword}) async {

    var mydata = {
      "name": '$name',
      "image": '$email',
      "voice": '$password',
      "mobile": '$mobile',
      "email": '$email',
    };
    var res = await http.post(Uri.parse("$apiurl/register"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: mydata);
    print("ggggggggggggg ${res}");

    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

}