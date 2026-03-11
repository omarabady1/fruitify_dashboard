import 'package:fruitify_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruitify_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:fruitify_dashboard/core/errors/failures.dart';

class ProductsRepoImplementation implements ProductsRepo {
  @override
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity) {
    throw UnimplementedError();
  }
}