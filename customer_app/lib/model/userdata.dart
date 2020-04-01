import 'package:flutter_app1/utils/firebaseutil.dart';
const String USERS = "users";
class UserData {
  String id;
  String name;
  int phone;
  String email;
  int age;

  UserData( {this.id, this.name, this.phone, this.email, this.age });
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    phone = json['phone'] as int;
    email = json['email']as String;
    age = json['age']as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['age'] = this.age;
    return data;
  }

  static UserData getUser(int phone) {
    Map<String, dynamic> jData = FirebaseUtil.readRow(USERS, phone.toString());
    UserData data = UserData.fromJson(jData);
    return data;
  }

  static List<UserData> getUsers() {
    List<UserData> rt = new List<UserData>();
    List<Map<String, dynamic>> jDataList = FirebaseUtil.readCollection(USERS);
    for(int i = 0; i < jDataList.length; i++ ) {
      UserData data = UserData.fromJson(jDataList[i]);
      rt.add(data);
    }
    return rt;
  }


  static bool create(String name, int phone, String email, int age) {
    UserData data = new UserData(id:phone.toString(), name:name,phone:phone,email: email, age: age);
    bool rt = FirebaseUtil.createWithCustomRowId(USERS, data.toJson(), data.id);
    return rt;
  }
}