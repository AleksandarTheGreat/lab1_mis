import 'package:flutter/material.dart';
import 'package:lab1_mis/model/Exam.dart';

class CardExam extends StatelessWidget {
  const CardExam({super.key, required this.exam});

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: exam.dateTime.isAfter(DateTime.now())? Colors.green[100]: Colors.red[100],
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => print("Not ready yet bro"),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.sticky_note_2_outlined),
                  SizedBox(width: 8.0,),
                  Expanded(child: Text(exam.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), softWrap: true,)),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 8.0,),
                  Expanded(child: Text("${exam.dateTime.day}-${exam.dateTime.month}-${exam.dateTime.year}", style: TextStyle(fontSize: 16), softWrap: true,)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.timer_outlined),
                  SizedBox(width: 8.0,),
                  Expanded(child: Text("${exam.dateTime.hour}:${exam.dateTime.minute}h", style: TextStyle(fontSize: 16), softWrap: true,)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.room_outlined),
                  SizedBox(width: 8.0,),
                  Expanded(child: Text("Exam takes place in ${exam.rooms.length} labs", style: TextStyle(fontSize: 18), softWrap: true,)),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
