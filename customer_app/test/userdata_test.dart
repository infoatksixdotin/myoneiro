// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/widgets.dart';
import 'package:flutter_app1/model/userdata.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('User Data Tests', () {
    /*test('Write Test', () {
      bool rt = UserData.create("kannan",9901352552, "kannan.u@gmail.com", 44);
      expect(rt,true);
    });

    test('Read Row Test', () {
      UserData user = UserData.getUser(9901352552);
      expect(user.id,9901352552);
      expect(user.name,"kannan");
      expect(user.phone,9901352552);
      expect(user.email,"kannan.u@gmail.com");
      expect(user.age,44);
    });
    */

    test('Read Users', () {
      List<UserData> users = UserData.getUsers();
      expect(users.length > 0, isTrue);
    });

    /*
    //expect(Counter().value, 0);

    test('Read Test', () {
    });
 
    test('Update Test', () {
      
    });*/
  });
}
