import 'package:get_it/get_it.dart';
import 'package:fruitify_dashboard/core/services/fire_storage_service.dart';
import 'package:fruitify_dashboard/core/services/cloud_storage_service.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<CloudStorageService>(() => FireStorageService());
}
