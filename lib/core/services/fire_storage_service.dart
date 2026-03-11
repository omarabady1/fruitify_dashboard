import 'dart:io';
import 'package:fruitify_dashboard/core/services/cloud_storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService implements CloudStorageService {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File image, String path) async {
    final fileName = path + image.path.split('/').last;
    final uploadTask = storageReference.child(fileName).putFile(image);
    final snapshot = await uploadTask;
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
