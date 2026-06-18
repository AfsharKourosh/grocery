import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery/src/app/presentation/screens/grocery_app.dart';

void main() async{WidgetsFlutterBinding.ensureInitialized();
await GetStorage.init();
  runApp(const GroceryApp());
}
