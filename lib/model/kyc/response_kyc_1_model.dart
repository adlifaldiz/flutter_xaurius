// To parse this JSON data, do
//
//     final responseKyc1 = responseKyc1FromJson(jsonString);

import 'dart:convert';

ResponseKyc1 responseKyc1FromJson(String str) => ResponseKyc1.fromJson(json.decode(str));

String responseKyc1ToJson(ResponseKyc1 data) => json.encode(data.toJson());

class ResponseKyc1 {
  bool success;
  String msg;
  Data data;

  ResponseKyc1({
    this.success,
    this.msg,
    this.data,
  });

  factory ResponseKyc1.fromJson(Map<String, dynamic> json) => ResponseKyc1(
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.orang,
  });

  Orang orang;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orang: Orang.fromJson(json["orang"]),
      );

  Map<String, dynamic> toJson() => {
        "orang": orang.toJson(),
      };
}

class Orang {
  Orang({
    this.id,
    this.orangEmail,
    this.orangName,
    this.orangKycStatus,
    this.orangKycEditAvailable,
    this.orangKycAskForReview,
    this.orangPhone,
    this.orangBirthday,
    this.orangAddrStreet,
    this.orangAddrCity,
    this.orangAddrPostal,
    this.orangAddrCountry,
    this.orangIdType,
    this.orangIdNum,
    this.orangIdFile,
    this.orangNpwpNum,
    this.orangNpwpFile,
    this.orangRefcode,
    this.orangRefupline,
  });

  int id;
  String orangEmail;
  dynamic orangName;
  String orangKycStatus;
  bool orangKycEditAvailable;
  bool orangKycAskForReview;
  dynamic orangPhone;
  dynamic orangBirthday;
  dynamic orangAddrStreet;
  dynamic orangAddrCity;
  dynamic orangAddrPostal;
  dynamic orangAddrCountry;
  dynamic orangIdType;
  dynamic orangIdNum;
  OrangFile orangIdFile;
  dynamic orangNpwpNum;
  OrangFile orangNpwpFile;
  dynamic orangRefcode;
  int orangRefupline;

  factory Orang.fromJson(Map<String, dynamic> json) => Orang(
        id: json["id"],
        orangEmail: json["orang_email"],
        orangName: json["orang_name"],
        orangKycStatus: json["orang_kyc_status"],
        orangKycEditAvailable: json["orang_kyc_edit_available"],
        orangKycAskForReview: json["orang_kyc_ask_for_review"],
        orangPhone: json["orang_phone"],
        orangBirthday: json["orang_birthday"],
        orangAddrStreet: json["orang_addr_street"],
        orangAddrCity: json["orang_addr_city"],
        orangAddrPostal: json["orang_addr_postal"],
        orangAddrCountry: json["orang_addr_country"],
        orangIdType: json["orang_id_type"],
        orangIdNum: json["orang_id_num"],
        orangIdFile: OrangFile.fromJson(json["orang_id_file"]),
        orangNpwpNum: json["orang_npwp_num"],
        orangNpwpFile: OrangFile.fromJson(json["orang_npwp_file"]),
        orangRefcode: json["orang_refcode"],
        orangRefupline: json["orang_refupline"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orang_email": orangEmail,
        "orang_name": orangName,
        "orang_kyc_status": orangKycStatus,
        "orang_kyc_edit_available": orangKycEditAvailable,
        "orang_kyc_ask_for_review": orangKycAskForReview,
        "orang_phone": orangPhone,
        "orang_birthday": orangBirthday,
        "orang_addr_street": orangAddrStreet,
        "orang_addr_city": orangAddrCity,
        "orang_addr_postal": orangAddrPostal,
        "orang_addr_country": orangAddrCountry,
        "orang_id_type": orangIdType,
        "orang_id_num": orangIdNum,
        "orang_id_file": orangIdFile.toJson(),
        "orang_npwp_num": orangNpwpNum,
        "orang_npwp_file": orangNpwpFile.toJson(),
        "orang_refcode": orangRefcode,
        "orang_refupline": orangRefupline,
      };
}

class OrangFile {
  OrangFile({
    this.url,
  });

  dynamic url;

  factory OrangFile.fromJson(Map<String, dynamic> json) => OrangFile(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
