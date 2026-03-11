import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify_dashboard/core/helper_functions/setup_service_locator.dart';
import 'package:fruitify_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruitify_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruitify_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruitify_dashboard/features/add_product/presentation/views/widgets/add_product_body.dart';
import 'package:fruitify_dashboard/core/widgets/custom_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          imagesRepo: getIt<ImagesRepo>(),
          productsRepo: getIt<ProductsRepo>(),
        ),
        child: const AddProductBody(),
      ),
    );
  }
}
