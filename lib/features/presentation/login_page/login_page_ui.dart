import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'login_page_logic.dart';

class LoginPageUi extends StatelessWidget {
  static const String PATH = '/login_page';
  final logic = Get.find<LoginPageLogic>();
  final state = Get.find<LoginPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Maos',
            style: TextStyle(fontSize: 40),
          ),
          const Text(
            'Login',
            style: TextStyle(fontSize: 20),
          ),
          TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email),
                  hintText: 'masukkan nama')),
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.remove_red_eye_outlined),
              hintText: "password",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              logic.onRequestLogin();
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'NunitoSans',
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
          ),
        ],
      ),
    ));
  }
}
