import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_reservations/Core/Resources/String.dart';
import 'package:my_reservations/Feature/Auth/pagesForTest/Register_Page_Test.dart';
import 'package:my_reservations/Feature/Order/Home_Page.dart';
import 'package:my_reservations/Feature/Auth/pagesForTest/First_Page_test.dart';

TextEditingController Username = TextEditingController();
TextEditingController Password = TextEditingController();
bool obsecure = true;

class LoginPageTest extends StatelessWidget {
  const LoginPageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Login',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(49, 56, 79, 1)),
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: double.maxFinite,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 15),
                child: SizedBox(
                  width: 328,
                  height: 66,
                  child: TextField(
                    controller: Username,
                    decoration: InputDecoration(
                      label: Text(
                        'Email or username',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(131, 135, 149, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromRGBO(226, 227, 228, 1))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: SizedBox(
                  width: 328,
                  height: 66,
                  child: StatefulBuilder(
                    builder: (context, setState) => TextField(
                      obscureText: obsecure,
                      controller: Password,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                obsecure = !obsecure;
                              },
                            );
                          },
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                        label: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(131, 135, 149, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(226, 227, 228, 1))),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 120),
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(240, 89, 132, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 170),
                child: Text(
                  'Or sign in with',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(45, 67, 121, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 60),
                child: Container(
                  width: 328,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(24, 119, 242, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Continue with Facebook',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Container(
                  width: 328,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.telegram,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.54),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPageTest()));
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(45, 67, 121, 1)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 30),
                child: InkWell(
                  onTap: () {
                    if (hasAccount == true) {
                      if (Username.text == user.UserName &&
                          Password.text == user.password &&
                          Username.text.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Username or Password is incorrect'),
                        backgroundColor: Color.fromRGBO(240, 89, 132, 1),
                        behavior: SnackBarBehavior.floating,
                      ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('You Dont Have An Account'),
                        backgroundColor: Color.fromRGBO(240, 89, 132, 1),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: Container(
                    width: 311,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 248, 250, 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromRGBO(131, 135, 149, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
