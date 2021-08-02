import 'package:flutter/material.dart';
import 'package:hello_world/firebase.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _pswdCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Masuk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 350,
                  // height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email', border: InputBorder.none),
                      controller: _emailCtrl,
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 350,
                  // height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password', border: InputBorder.none),
                        controller: _pswdCtrl,
                      ))),
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
                          Text('Masuk', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                onPressed: () async {
                  try {
                    await AuthController.signIn(
                        _emailCtrl.text, _pswdCtrl.text);
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
              ),
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
                          Text('Daftar', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                onPressed: () async {
                  try {
                    await AuthController.signUp(
                        _emailCtrl.text, _pswdCtrl.text);
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
