import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/firebase.dart';
import 'package:hello_world/bungkus.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        initialData: null,
        value: AuthController.userStream,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Bungkus(),
        ));
  }
}
