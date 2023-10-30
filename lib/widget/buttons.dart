import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class ClickButton extends StatelessWidget {
  const ClickButton({
    required this.point,
    required this.team,
    required this.buttonNumber,
  });

  final String point;
  final String team;
  final int buttonNumber;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8),
        backgroundColor: Colors.orange,
        minimumSize: Size(150, 50),
      ),
      onPressed: () {
        BlocProvider.of<CounterCubit>(context)
            .teamIncrement(team: team, buttonNumber: buttonNumber);
      },
      child: Text(
        point,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
