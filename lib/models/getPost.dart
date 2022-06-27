// To parse this JSON data, do
//
//     final getPost = getPostFromJson(jsonString);

import 'dart:convert';

List<GetPost> getPostFromJson(String str) =>
    List<GetPost>.from(json.decode(str).map((x) => GetPost.fromJson(x)));

String getPostToJson(List<GetPost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPost {
  GetPost({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String? body;

  factory GetPost.fromJson(Map<String, dynamic> json) => GetPost(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
