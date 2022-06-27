import 'dart:convert';

import 'package:api_practice/models/getClient.dart';
import 'package:api_practice/models/getPost.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<List<GetPost>?> getAPIPost() async {
    // var client = http.Client();

    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var jsonD = getPostFromJson(response.body);
      //print(jsonD);
      return jsonD;
    } else {
      print('error');
    }
  }

  Future<List<GetPost>> getFutureAPIPost() async {
    var client = http.Client();
    var data;

    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      //print(jsonD);
      List<dynamic> list = jsonDecode(response.body);
      data = list.map((e) => GetPost.fromJson(e)).toList();
    } else {
      print('error');
    }
    return data;
  }

  Future<GetClientData> getClientAPI() async {
    var data;
    var response = await http.get(Uri.parse(
        'https://budhanilkantha.org/mobilebanking/api/v2/getClientList'));

    //print(response.body);
    if (response.statusCode == 200) {
      //print(jsonD);
      var json = jsonDecode(response.body);
      data = GetClientData.fromJson(json);
      print(data);
    } else {
      print('error');
    }
    return data;
  }
}
