import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery/src/app/grocery_app.dart';

void main() async{WidgetsFlutterBinding();
await GetStorage.init;
  runApp(const GroceryApp());
}
