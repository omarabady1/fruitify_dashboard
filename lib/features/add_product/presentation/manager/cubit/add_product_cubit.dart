import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruitify_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruitify_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productsRepo})
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);
    result.fold((failure) => emit(AddProductFailure(failure.message)), (
      imageUrl,
    ) async {
      addProductInputEntity.imageUrl = imageUrl;
      var result = await productsRepo.addProduct(addProductInputEntity);
      result.fold(
        (failure) => emit(AddProductFailure(failure.message)),
        (r) => emit(AddProductSuccess()),
      );
    });
  }
}
