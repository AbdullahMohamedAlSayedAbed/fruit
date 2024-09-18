import 'package:fruit/Features/auth/domin/entites/user_entity.dart';

abstract class DatabaseService {
 Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
       String? documentId});
  Future<Map<String, dynamic>> getData({required String path,required String documentId});
  Future<bool> checkIfDataExists({required String path,required String documentId});
  // Future<void> updateData(String path, Map<String, dynamic> data);
  // Future<void> deleteData(String path);
  // Future<T?> getData<T>(String path);
}