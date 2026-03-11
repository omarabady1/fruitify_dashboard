import 'dart:io';
import 'package:fruitify_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruitify_dashboard/core/services/cloud_storage_service.dart';
import 'package:fruitify_dashboard/core/utils/backend_endpoints.dart';
import 'package:dartz/dartz.dart';
import 'package:fruitify_dashboard/core/errors/failures.dart';

class ImagesRepoImplementation implements ImagesRepo {
  final CloudStorageService cloudStorageService;
  ImagesRepoImplementation({required this.cloudStorageService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      final result = await cloudStorageService.uploadFile(
        image,
        BackendEndpoints.images,
      );
      return right(result);
    } catch (e) {
      return left(ServerFailure('Failed to upload image: ${e.toString()}'));
    }
  }
}
