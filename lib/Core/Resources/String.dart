import 'package:my_reservations/Core/Domain/Model/User_model.dart';

late String myRoomReservationId;
bool isRoomReserved = false;
bool isTableReserved = false;
late String myTableReservationId;

late UserModel user;
late bool hasAccount = false;

DateTime time = DateTime.now();

  String year = time.year.toString();
  String month = time.month.toString();
  String day = time.day.toString();
  String hour = time.hour.toString();
  String minute = time.minute.toString();
  String second = time.second.toString();

  String timeSpaceForMonth = '';
  String timeSpaceForDay = '';
  String timeSpaceForHour = '';
  String timeSpaceForMinute = '';
  String timeSpaceForSecond = '';

  List<String>timeProperty =[month,day,hour,minute,second];
  List<String>timeSpace = ['','','','',''];
