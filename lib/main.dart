import 'package:flutter/material.dart';
import 'package:marketwick_assignment/presentation/my_app.dart';

import 'di/serivce_locators.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.configureDependencies();


  runApp(const MyApp());
}


