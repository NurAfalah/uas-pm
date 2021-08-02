import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/firebase.dart';

class Home extends StatelessWidget {
  final User user;
  Home(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('UID:'),
              Text(user.uid),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                child: Container(
                  width: 500,
                  color: Colors.red,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15),
                      child:
                          Text('Keluar', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                onPressed: () async {
                  await AuthController.signOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
