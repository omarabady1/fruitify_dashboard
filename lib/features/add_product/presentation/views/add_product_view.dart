import 'package:flutter/material.dart';
import 'package:fruitify_dashboard/features/add_product/presentation/views/widgets/add_product_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AddProductBody());
  }
}
