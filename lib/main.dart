import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/buttons.dart';

void main() {
  runApp(PointsCounter());
}

class PointsCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text('points Counter'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Team A',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            BlocProvider.of<CounterCubit>(context)
                                .teamAPoints
                                .toString(),
                            style: TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          ClickButton(
                            buttonNumber: 1,
                            point: 'Add 1 point',
                            team: 'A',
                          ),
                          ClickButton(
                            buttonNumber: 2,
                            point: 'Add 2 point',
                            team: 'A',
                          ),
                          ClickButton(
                            buttonNumber: 3,
                            point: 'Add 3 point',
                            team: 'A',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      child: VerticalDivider(
                        indent: 50,
                        endIndent: 50,
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Container(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Team B',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            BlocProvider.of<CounterCubit>(context)
                                .teamBPoints
                                .toString(),
                            style: TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          ClickButton(
                            buttonNumber: 1,
                            point: 'Add 1 point',
                            team: 'B',
                          ),
                          ClickButton(
                            buttonNumber: 2,
                            point: 'Add 2 point',
                            team: 'B',
                          ),
                          ClickButton(
                            buttonNumber: 3,
                            point: 'Add 3 point',
                            team: 'B',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    backgroundColor: Colors.orange,
                    minimumSize: Size(150, 50),
                  ),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).resetState();
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
