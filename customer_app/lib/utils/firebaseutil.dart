import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtil {
  static Future<bool> create(String collectionName, Map<String,dynamic> dataRow, String rowId) async {
    bool rt = false;
    try {
          await Firestore.instance.collection(collectionName)
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

  static Future<bool> update(String collectionName, Map<String,dynamic> dataRow, String rowId) async {
    bool rt = false;
    try {
          await Firestore.instance.collection(collectionName)
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

  static Future<List<Map<String, dynamic>>> readCollection(String collectionName) async {
    List<Map<String, dynamic>> rt = List<Map<String, dynamic>>();
    try {
        final List<DocumentSnapshot> documents = (await Firestore.instance.collection(collectionName).getDocuments()).documents;
        for(int i = 0 ; i < documents.length; i++) {
            Map<String, dynamic> element = documents[i].data;
            rt.add(element);
        }
    }
    catch(e) {
      print(e);
    }
    return rt;
  }

  static Future<Map<String, dynamic>> readRow(String collectionName, String rowId) async {
    Map<String, dynamic> rt = Map<String, dynamic>();
    try {
          await Firestore.instance.collection(collectionName)
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
  
  static Future<bool> delete(String collectionName, String rowId) async {
    bool rt = false;
    try {
          await Firestore.instance.collection(collectionName)
                        .document(rowId)
                        .delete()
                        .then((result) => {
                          rt = true})
                        .catchError((err) => print(err));
    }
    catch(e) {
      print(e);
    }
    return rt;
  }

  // not used in this project.
  static Future<bool> createWithDefaultId(String collectionName, Map<String,dynamic> dataRow) async {
    bool rt = false;
    try {
          await Firestore.instance.collection(collectionName)
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

  static void logError(var err) {
     print(err);
  }
}