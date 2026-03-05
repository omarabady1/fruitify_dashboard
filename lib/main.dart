import 'package:flutter/material.dart';
import 'package:fruitify_dashboard/core/helper_functions/on_generate_routs.dart';
import 'package:fruitify_dashboard/features/dashboard/views/dashboard_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}
