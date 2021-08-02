import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/login.dart';
import 'package:hello_world/home.dart';
import 'package:provider/provider.dart';

class Bungkus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return (user != null) ? Home(user) : Login();
  }
}
