import 'dart:convert';
import 'package:api_practice/models/getClient.dart';
import 'package:api_practice/models/getPost.dart';
import 'package:api_practice/services/network_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GetPost>? posts;

  Future<GetClientData>? _getClientList;

  var isLoading = false;

  var futurepost;

  var getDatum;

  @override
  void initState() {
    getData();
    getFutureData();

    getDatum = getFutureData1();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    posts = await NetworkHelper().getAPIPost();
    if (posts != null) {
      setState(() {
        isLoading = true;
      });
    }
    // print(posts);
  }

  getFutureData() async {
    futurepost = await NetworkHelper().getFutureAPIPost();
    //print(futurepost);
  }

  Future<GetClientData>? getFutureData1() async {
    var getClient = await NetworkHelper().getClientAPI();
    print(getClient);
    return getClient;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: futurepost.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(futurepost[index].title),
            );
          }),
    );
  }
}


// SafeArea(
//           child: FutureBuilder<GetClientData?>(
//               future: _getClientList,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                       itemCount: snapshot.data?.data?.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                             child: Text(
//                                 snapshot.data!.data![index].clientName ??
//                                     'sds'));
//                       });
//                 }
//                 if (snapshot.connectionState != ConnectionState.done) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   return Center(
//                     child: Text('NO data'),
//                   );
//                 }
//               })),