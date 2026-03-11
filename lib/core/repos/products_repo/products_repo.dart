import 'package:fruitify_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:fruitify_dashboard/core/errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity);
}