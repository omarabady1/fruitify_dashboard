import 'package:flutter/material.dart';
import 'package:fruitify_dashboard/features/add_product/presentation/views/widgets/add_product_body.dart';
import 'package:fruitify_dashboard/widgets/custom_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Add Product'),
      body: AddProductBody(),
    );
  }
}
