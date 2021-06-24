class UserData {
  UserData({
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
    this.orangBankHolder,
    this.orangBankNumber,
    this.orangBankName,
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
  String orangName;
  String orangKycStatus;
  bool orangKycEditAvailable = false;
  bool orangKycAskForReview;
  String orangPhone;
  String orangBirthday;
  String orangAddrStreet;
  String orangAddrCity;
  String orangAddrPostal;
  String orangAddrCountry;
  String orangBankHolder;
  String orangBankNumber;
  String orangBankName;
  String orangIdType;
  String orangIdNum;
  UserFile orangIdFile;
  String orangNpwpNum;
  UserFile orangNpwpFile;
  String orangRefcode;
  int orangRefupline;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
        orangBankHolder: json["orang_bank_holder"],
        orangBankNumber: json["orang_bank_number"],
        orangBankName: json["orang_bank_name"],
        orangIdType: json["orang_id_type"],
        orangIdNum: json["orang_id_num"],
        orangIdFile: UserFile.fromJson(json["orang_id_file"]),
        orangNpwpNum: json["orang_npwp_num"],
        orangNpwpFile: UserFile.fromJson(json["orang_npwp_file"]),
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
        "orang_bank_holder": orangBankHolder,
        "orang_bank_number": orangBankNumber,
        "orang_bank_name": orangBankName,
        "orang_id_type": orangIdType,
        "orang_id_num": orangIdNum,
        "orang_id_file": orangIdFile.toJson(),
        "orang_npwp_num": orangNpwpNum,
        "orang_npwp_file": orangNpwpFile.toJson(),
        "orang_refcode": orangRefcode,
        "orang_refupline": orangRefupline,
      };
}

class UserFile {
  UserFile({
    this.url,
  });

  String url;

  factory UserFile.fromJson(Map<String, dynamic> json) => UserFile(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
