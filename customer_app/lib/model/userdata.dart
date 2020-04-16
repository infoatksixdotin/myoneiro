import 'package:flutter_app1/utils/firebaseutil.dart';
import 'package:flutter_app1/utils/miscutil.dart';
import 'package:uuid/uuid.dart';

class UserData {
  String id;
  String name;
  int phone;
  String email;
  int age;
  String location;
  int pincode;

  UserData( {this.id, this.name, this.phone, this.email, this.age, this.location, this.pincode });
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    phone = json['phone'] as int;
    email = json['email']as String;
    age = json['age']as int;
    location = json ['location'] as String;
    pincode = json ['pincode'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['age'] = this.age;
    data['location'] = this.location;
    data['pincode'] = this.pincode;
    return data;
  }

String validateUser() {
    String errMsg = "";
    if (!MiscUtil.validateName(this.name)) {
        errMsg += "Invalid name\n";
	  } 
    if (!MiscUtil.validatePhone(this.phone)) {
        errMsg += "Phone number should be 10 digits\n";
    }
    if (!MiscUtil.validateEmail(this.email)) {
        errMsg += "Invalid email\n";
    }
    if (this.age < 18) {
        errMsg += "Invalid age, should be on or above 18\n";
    }
    if (!MiscUtil.validateLocation(this.location)) {
      errMsg += "Invalid Location\n";
    }
    if (!MiscUtil.validatePincode(this.pincode)) {
      errMsg += "Invalid Pincode\n";
    }

    return errMsg;
}

bool checkPhone(int phone) {
  return phone == this.phone;
}
  
  static Future<bool> getUserReq(String id) async  {
    if (m_userData == null) {
      Map<String, dynamic> jData = await FirebaseUtil.readRow(USERS, id);
      if (jData != null) {
        m_userData = UserData.fromJson(jData);
        return true;
      }
    }
    return false;
  }

  static List<UserData> getUsers() {
    return m_users;
  }

  static UserData getUser() {
    return m_userData;
  }
 
  static Future<bool> getUsersReq() async  {
    m_users = new List<UserData>();
    List<Map<String, dynamic>> jDataList = await FirebaseUtil.readCollection(USERS);
    for(int i = 0; i < jDataList.length; i++ ) {
      UserData data = UserData.fromJson(jDataList[i]);
      m_users.add(data);
    }
    return m_users.length > 0;
  }
  static Future<bool> createReq(UserData data) async {
    data.id = Uuid().v1(); // this should be initialized only on creation
    bool rt = await FirebaseUtil.create(USERS, data.toJson(), data.id);
    if (rt) {
      m_userData = data;
    }
    return rt;
  }
  static Future<bool> updateReq(UserData data) async {
    bool rt = await FirebaseUtil.create(USERS, data.toJson(), data.id);
    if (rt) {
      m_userData = data;
    }
    return rt;
  }

  static Future<bool> deleteUserReq(String id) async  {
     return await FirebaseUtil.delete(USERS, id) ;
  }

  static Future<bool> getUserByPhoneReq(int phone) async  {
    UserData existingUserData = null;
    List<Map<String, dynamic>> jDataList = await FirebaseUtil.readCollection(USERS);
    for(int i = 0; i < jDataList.length; i++ ) {
      UserData data = UserData.fromJson(jDataList[i]);
      if (data.checkPhone(phone)) {
          existingUserData = data;
          m_userData = existingUserData;
          break;
      }
    }
    return existingUserData != null;
  }
  static UserData m_userData = null;
  static List<UserData> m_users = null;
  static String USERS = "my_oneiro_users";
 }