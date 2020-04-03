import 'package:flutter_app1/model/userdata.dart';
import 'package:flutter_app1/utils/localstorage.dart';

class AppManager {
  static const String USERID = "userid";
  static const String PHONE = "phone";
  static bool m_newUser = false;

  static Future<String> getLocalUserId() async {
    Future<String> rt = LocalStorage.getValue(USERID);
    rt.then((value) => {
    })
    .catchError((error) => {
    });
    return rt;
  }

  static Future<bool> saveLocal(UserData data) async {
    Future<bool> rt = LocalStorage.setValue(USERID, data.id);
    rt = LocalStorage.setValue(PHONE, data.phone.toString());
    return rt;
  }

  static bool newUser() {
    return m_newUser;
  }
  static bool setNewUser(bool bNewuser) {
    return m_newUser = bNewuser;
  }
}