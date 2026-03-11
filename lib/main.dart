import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruitify_dashboard/core/helper_functions/on_generate_routs.dart';
import 'package:fruitify_dashboard/core/helper_functions/setup_service_locator.dart';
import 'package:fruitify_dashboard/core/utils/simple_bloc_observer.dart';
import 'package:fruitify_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruitify_dashboard/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}

