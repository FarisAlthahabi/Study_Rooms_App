import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reservations/Feature/Order/Book_Table_Page.dart';
import 'package:my_reservations/Feature/Order/Show_Room_Categories_Page.dart';
import 'package:my_reservations/Feature/Order/bloc/table_bloc.dart';
import 'package:my_reservations/Feature/Shared_pages/Shared_widgets.dart';

class StudyRoomPage extends StatelessWidget {
  const StudyRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableBloc()..add(GetAllTablesEvent()),
      child: BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          if (state is LoadingTablesState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          else if (state is SuccessToGetAllTablesState){
            return Scaffold(
            body: Container(
              height: 470,
              child: ListView.builder(
                itemCount: state.tables.tables.length,
                itemBuilder: (context,index)=>Container(
              height: 470,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 161,
                      width: 350,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(123, 157, 226, 1),
                          Color.fromRGBO(59, 59, 192, 1)
                        ]),
                        boxShadow: [BoxShadow()],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  width: 109,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text(
                                      '${state.tables.tables[index].id}',
                                     // '36 Spots available',
                                      style: TextStyle(
                                          color: Color.fromRGBO(24, 24, 41, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.asset('lib/Core/Resources/assets/image 13.png'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'COSEL creates studying spaces that help \n students go further, faster by building a positive\n community dreaming of a better tomorrow.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(131, 135, 149, 1),
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            )
                          ]),
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 40),
                        child: Container(
                          height: 170,
                          width: 350,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(123, 157, 226, 1),
                              Color.fromRGBO(59, 59, 192, 1)
                            ]),
                            boxShadow: [BoxShadow()],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 109,
                                    height: 23,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12)),
                                    child: Center(
                                      child: Text(
                                        '${state.tables.tables[index].available_seats}',
                                       // '12 Spots available',
                                        style: TextStyle(
                                            color: Color.fromRGBO(24, 24, 41, 1),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Text(
                                      '${state.tables.tables[index].status==1 ?'Available':
                                   state.tables.tables[index].status==2 ? 'Reserved' : 'Full' }',
                                   // 'UpStaires Room',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                  //   '${state.tables.tables[index].status==1 ?'Available':
                                  //  state.tables.tables[index].status==2 ? 'Reserved' : 'Full' }',
                                    'Welcome to COSEL',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Image.asset(
                                  'lib/Core/Resources/assets/image 13.png'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 170, left: 30),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowStudyRoomsPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: BookNowBottom(),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),))
            
          );
          }
          else if (state is FailedToGetAllTablesState) {
            return Scaffold(
              body: Center(child: Text('${state.error}')),
            );
          }
          else{
            return Scaffold(
              body: Center(child: Text('Error')),
            );
          }
          
        },
      ),
    );
  }
}
