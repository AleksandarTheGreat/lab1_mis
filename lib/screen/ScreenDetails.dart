import 'package:flutter/material.dart';
import 'package:lab1_mis/model/Exam.dart';

class ScreenDetails extends StatefulWidget {
  const ScreenDetails({super.key, required this.exam});

  final Exam exam;

  @override
  State<ScreenDetails> createState() => _ScreenDetailsState(exam: exam);
}

class _ScreenDetailsState extends State<ScreenDetails> {
  _ScreenDetailsState({required this.exam});

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    final duration = exam.dateTime.difference(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text("Raspored na ispiti - 213163")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${exam.name}", style: TextStyle(fontSize: 32), textAlign: TextAlign.center,),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 8.0,),
                  Text("${exam.dateTime.day}-${exam.dateTime.month}-${exam.dateTime.year}", style: TextStyle(fontSize: 24), softWrap: true,),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer_outlined),
                  SizedBox(width: 8.0,),
                  Text("${exam.dateTime.hour}:${exam.dateTime.minute}h", style: TextStyle(fontSize: 24), softWrap: true,),
                ],
              ),
              SizedBox(height: 24),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: exam.rooms.map((room) => Text(room, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)).toList(),
              ),
              SizedBox(height: 36,),
              if (duration.isNegative)
                Text("Exam has already passed", style: TextStyle(fontSize: 24, color: Colors.red),)
              else
                Text("${duration.inDays} days left", style: TextStyle(fontSize: 24, color: Colors.green),),
            ],
          ),
        ),
      ),
    );
  }
}
