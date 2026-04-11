import 'package:fruitify_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruitify_dashboard/core/services/database_service.dart';
import 'package:fruitify_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruitify_dashboard/features/add_product/data/models/product_model.dart';
import 'package:fruitify_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:fruitify_dashboard/core/errors/failures.dart';

class ProductsRepoImplementation implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImplementation({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(
    ProductEntity addProductInputEntity,
  ) async {
    try {
      await databaseService.addData(
        path: BackendEndpoints.addProduct,
        data: ProductModel.fromEntity(addProductInputEntity).toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product ${e.toString()}'));
    }
  }
}
