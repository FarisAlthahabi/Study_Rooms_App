import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_reservations/Core/Domain/Model/User_model.dart';
import 'package:my_reservations/Core/Resources/String.dart';
import 'package:my_reservations/Feature/Auth/pagesForTest/First_Page_test.dart';
import 'package:my_reservations/Feature/Auth/pagesForTest/Login_Page_test.dart';

TextEditingController UserName = TextEditingController();
TextEditingController Role = TextEditingController();
TextEditingController PhoneNumber = TextEditingController();
TextEditingController Password = TextEditingController();
TextEditingController ConfirmPassword = TextEditingController();
bool obsecure = true;

class RegisterPageTest extends StatelessWidget {
  const RegisterPageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Create Account',
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 15),
                child: SizedBox(
                  width: 328,
                  height: 66,
                  child: TextField(
                    controller: UserName,
                    decoration: InputDecoration(
                      label: Text(
                        'User Name',
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
                  child: TextField(
                    controller: Role,
                    decoration: InputDecoration(
                      label: Text(
                        'Role',
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
                  child: TextField(
                    controller: PhoneNumber,
                    decoration: InputDecoration(
                      label: Text(
                        'PhoneNumber',
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
                              icon: Icon(Icons.remove_red_eye_outlined)),
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
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: SizedBox(
                  width: 328,
                  height: 66,
                  child: StatefulBuilder(
                    builder: (context, setState) => TextField(
                      obscureText: obsecure,
                      controller: ConfirmPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  obsecure = !obsecure;
                                },
                              );
                            },
                            icon: Icon(Icons.remove_red_eye_outlined)),
                        label: Text(
                          'Confirm Password',
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
                padding: const EdgeInsets.only(left: 15, top: 130),
                child: InkWell(
                  onTap: () {
                    if (Password.text == ConfirmPassword.text &&
                        Password.text != null && num.parse(PhoneNumber.text) is num) {
                      user = UserModel(
                          UserName: UserName.text,
                          role: Role.text,
                          phoneNumber: num.parse(PhoneNumber.text),
                          password: Password.text);
                      hasAccount = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPageTest()));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Wrong phone number or password'),
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
                        'Create Account',
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
