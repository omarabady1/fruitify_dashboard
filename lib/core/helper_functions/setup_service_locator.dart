import 'package:fruitify_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruitify_dashboard/core/repos/products_repo/products_repo_implementation.dart';
import 'package:fruitify_dashboard/core/services/database_service.dart';
import 'package:fruitify_dashboard/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';
import 'package:fruitify_dashboard/core/services/cloud_storage_service.dart';
import 'package:fruitify_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruitify_dashboard/core/repos/images_repo/images_repo_implementaion.dart';
import 'package:fruitify_dashboard/core/services/supabase_storage_service.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<CloudStorageService>(() => SupabaseStorageService());
  getIt.registerLazySingleton<ImagesRepo>(
    () => ImagesRepoImplementation(cloudStorageService: getIt()),
  );
  getIt.registerLazySingleton<DatabaseService>(() => FirestoreService());
  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImplementation(databaseService: getIt<DatabaseService>()),
  );
}
