import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtil {
  static bool create(String collectionName, Map<String,dynamic> dataRow) {
    bool rt = false;
    try {
      Firestore.instance.collection(collectionName)
                        .add(dataRow)
                        .then((result) => {
                          rt = true})
                        .catchError((err) => print(err));
    }
    catch(e) {
      print(e);
    }
    return rt;
  }
 
  static bool createWithCustomRowId(String collectionName, Map<String,dynamic> dataRow, String rowId) {
    bool rt = false;
    try {
      Firestore.instance.collection(collectionName)
                        .document(rowId)
                        .setData(dataRow)
                        .then((result) => {
                          rt = true})
                        .catchError((err) => print(err));
    }
     catch(e) {
      print(e);
    }
    
    return rt;
  }

  static bool update() {
    return false;
  }

  static List<Map<String, dynamic>> readCollection(String collectionName)  {
    List<Map<String, dynamic>> rt = List<Map<String, dynamic>>();
    try {
      Firestore.instance
          .collection(collectionName)
          .snapshots()
          .listen((snapshot) {
              for(int i = 0 ; i < snapshot.documents.length; i++) {
                Map<String, dynamic> element = snapshot.documents[i].data;
                rt.add(element);
              }
            });
    }
    catch(e) {
      print(e);
    }
    return rt;
  }

  static Map<String, dynamic> readRow(String collectionName, String rowId) {
    Map<String, dynamic> rt = Map<String, dynamic>();
    try {
          Firestore.instance.collection(collectionName)
                            .document(rowId)
                            .get()
                            .then((DocumentSnapshot ds) {
                              rt = ds.data;
          });
    }
    catch(e) {
      print(e);
    }
    return rt;
  }
  
  static bool delete(String collectionName, Map dataRow) {
    return false;
  }

  static void logError(var err) {
     print(err);
  }
}