import 'package:fruitify_dashboard/core/services/cloud_storage_service.dart';
import 'package:dartz/dartz.dart';
import 'package:fruitify_dashboard/core/errors/failures.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService implements CloudStorageService {
  final storageReference = FirebaseStorage.instance;
  @override
    Future<Either<Failure, String>> uploadImage(String image) {
      throw UnimplementedError();
  }
}