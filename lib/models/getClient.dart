// To parse this JSON data, do
//
//     final getClientData = getClientDataFromJson(jsonString);

import 'dart:convert';

GetClientData getClientDataFromJson(String str) =>
    GetClientData.fromJson(json.decode(str));

String getClientDataToJson(GetClientData data) => json.encode(data.toJson());

class GetClientData {
  GetClientData({
    this.status,
    this.data,
    this.statusCode,
    this.message,
  });

  String? status;
  List<Datum>? data;
  int? statusCode;
  String? message;

  factory GetClientData.fromJson(Map<String, dynamic> json) => GetClientData(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status_code": statusCode,
        "message": message,
      };
}

class Datum {
  Datum({
    this.clientName,
    this.clientId,
    this.logo,
  });

  String? clientName;
  String? clientId;
  String? logo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        clientName: json["CLIENT_NAME"],
        clientId: json["CLIENT_ID"],
        logo: json["LOGO"] == null ? null : json["LOGO"],
      );

  Map<String, dynamic> toJson() => {
        "CLIENT_NAME": clientName,
        "CLIENT_ID": clientId,
        "LOGO": logo == null ? null : logo,
      };
}
