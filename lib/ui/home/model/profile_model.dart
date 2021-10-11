class ProfileModel {
  String? name;
  String? age;
  String? gender;
  String? phone;
  String? profileImage;
  String? email;

  ProfileModel.fromJSON(json) {
    try {
      name = json['name'] ?? '';
      age = json['age'] ?? '';
      gender = json['gender'] ?? '';
      phone = json['phoneNumber'] ?? '';
      profileImage = json['photoUrl'] == null ? "" : json['photoUrl'];
      email = json['email'] ?? '';
    } catch (e) {
      print('======================error');
      print(e);
    }
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "gender": gender,
        "phoneNumber": phone,
        "photoUrl": profileImage,
        "email": email,
      };
}
