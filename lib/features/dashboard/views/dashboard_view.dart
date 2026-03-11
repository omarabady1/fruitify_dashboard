import 'package:flutter/material.dart';
import 'package:fruitify_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruitify_dashboard/core/widgets/custom_button.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: CustomButton(
            label: 'Add Product',
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
          ),
        ),
      ),
    );
  }
}
