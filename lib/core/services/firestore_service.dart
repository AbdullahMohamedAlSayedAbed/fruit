import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(String path, Map<String, dynamic> data) async{
    await firestore.collection(path).add(data);
  }
  
}
