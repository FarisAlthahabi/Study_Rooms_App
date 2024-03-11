import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reservations/Core/Domain/Model/User_model.dart';
import 'package:my_reservations/Feature/Auth/First_Page.dart';
import 'package:my_reservations/Feature/Auth/bloc/user_bloc.dart';
import 'package:my_reservations/Feature/Auth/pagesForTest/First_Page_test.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController UserName = TextEditingController();
    TextEditingController Role = TextEditingController();
    TextEditingController PhoneNumber = TextEditingController();
    TextEditingController Password = TextEditingController();
    TextEditingController ConfirmPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: Text(
            'Create Account',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(49, 56, 79, 1)),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 24),
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
                            width: 3, color: Color.fromRGBO(226, 227, 228, 1))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 24),
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
                            width: 3, color: Color.fromRGBO(226, 227, 228, 1))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 24),
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
                            width: 3, color: Color.fromRGBO(226, 227, 228, 1))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 24),
              child: SizedBox(
                width: 328,
                height: 66,
                child: TextField(
                  controller: Password,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                            width: 3, color: Color.fromRGBO(226, 227, 228, 1))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 24),
              child: SizedBox(
                width: 328,
                height: 66,
                child: TextField(
                  controller: ConfirmPassword,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                            width: 3, color: Color.fromRGBO(226, 227, 228, 1))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 130),
              child: InkWell(
                onTap: () {
                  UserModel user = UserModel(
                      UserName: UserName.text,
                      role: Role.text,
                      phoneNumber: num.parse(PhoneNumber.text),
                      password: Password.text);
                  context.read<UserBloc>().add(RegisterEvent(user: user));
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return Scaffold(body: Center(child: CircularProgressIndicator(),),);
                      }
                      else if(state is SuccessToregisterState && Password.text==ConfirmPassword.text ){
                        return FirstPage() ;
                      }
                      else if (state is FailToRegisterState) {
                        return Scaffold(body: Center(child: Text(state.error.error.toString()),),);
                      }
                      else{
                        return Scaffold(body: Center(child: Text('error'),),);
                      }
                    },
                  );
                  
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
    );
  }
}
