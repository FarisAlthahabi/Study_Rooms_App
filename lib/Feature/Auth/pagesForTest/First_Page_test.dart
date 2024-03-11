// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_reservations/Core/Domain/Model/User_model.dart';
import 'package:my_reservations/Feature/Auth/bloc/user_bloc.dart';
import 'package:my_reservations/Feature/Auth/pagesForTest/Login_Page_test.dart';
import 'package:my_reservations/Feature/Auth/pagesForTest/Register_Page_Test.dart';

class FirstPageTest extends StatelessWidget {
   FirstPageTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('lib/Core/Resources/assets/logo.png'),
          Text(
            'LOOKING FOR A \n COZY STUDY SPOT',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'COSEL creates studying spaces that help students go further, faster by building a positive community dreaming of a better tomorrow.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPageTest()));
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
              width: 311,
              height: 56,
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 89, 132, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text('Login',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPageTest()));
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
              width: 311,
              height: 56,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      width: 2, color: Color.fromRGBO(59, 58, 54, 1))),
              child: Center(
                child: Text(
                  'Create account',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(59, 58, 54, 1)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
