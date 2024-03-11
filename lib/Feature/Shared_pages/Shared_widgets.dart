// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WelcomeToCoselText extends StatelessWidget {
  String appBarText;
   WelcomeToCoselText({
    Key? key,
    required this.appBarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      appBarText,
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(49, 56, 79, 1)),
    );
  }
}

double width = double.maxFinite;


class BookNowBottom extends StatelessWidget {
  const BookNowBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 56,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 89, 132, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text('Book Now'),
      ),
    );
  }
}
