import 'package:dartz/dartz.dart';
import 'package:fruitify_dashboard/core/errors/failures.dart';

abstract class CloudStorageService {
  Future<Either<Failure, String>> uploadImage(String image);
}
