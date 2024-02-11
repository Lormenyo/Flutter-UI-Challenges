import 'dart:convert';

import 'package:http/http.dart' as http;

const rizzURI = "https://vinuxd.vercel.app/api/pickup";

class RizzApi {
  static Future<String> fetchRizz() async {
    print("Fetching rizz....please wait");
    http.Response response = await http.get(Uri.parse(rizzURI));

    if (response.statusCode != 200) {
      print("Error occurred when fetching rizz");
      print(response.body);
    }

    return json.decode(response.body)["pickup"];
  }
}
