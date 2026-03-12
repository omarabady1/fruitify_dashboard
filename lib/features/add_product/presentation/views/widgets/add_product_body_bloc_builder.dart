import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify_dashboard/core/widgets/show_custom_snack_bar.dart';
import 'package:fruitify_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruitify_dashboard/features/add_product/presentation/views/widgets/add_product_body.dart';
import 'package:fruitify_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruitify_dashboard/core/widgets/show_error_snack_bar.dart';

class AddProductBodyBlocBuilder extends StatelessWidget {
  const AddProductBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          showErrorSnackBar(context, state.errorMessage);
        }
        if (state is AddProductSuccess) {
          showCustomSnackBar(context, 'Product added successfully');
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is AddProductLoading,
          child:const AddProductBody(),
        );
      },
    );
  }
}
