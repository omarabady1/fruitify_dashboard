import 'dart:io';
import 'package:fruitify_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:fruitify_dashboard/core/errors/failures.dart';

class ImagesRepoImplementation implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File image) {
    throw UnimplementedError();
  }
}