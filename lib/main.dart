import 'package:flutter/material.dart';
import 'package:lab1_mis/model/Exam.dart';
import 'package:lab1_mis/screen/ScreenDetails.dart';
import 'package:lab1_mis/widget/CardExam.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Exam> exams = [
    Exam(
      name: "Objektno Orientirano Programiranje",
      dateTime: DateTime(2025, 11, 12, 10, 0),
      rooms: ["Lab 2", "Lab 3"],
    ),
    Exam(
      name: "Strukturno Programiranje",
      dateTime: DateTime(2025, 12, 24, 20, 10),
      rooms: ["Lab 138", "Lab 2", "Lab 3"],
    ),
    Exam(
      name: "Napredno Programiranje",
      dateTime: DateTime(2025, 10, 20, 18, 45),
      rooms: ["Lab 200 AB", "Lab 200 V"],
    ),
    Exam(
      name: "Operativni Sistemi",
      dateTime: DateTime(2025, 11, 5, 14, 30),
      rooms: ["Lab 118", "Lab 200 V", "Lab 200 AB"],
    ),
    Exam(
      name: "Dizajn na interakcijata chovek kompjuter",
      dateTime: DateTime(2025, 11, 14, 16, 20),
      rooms: ["Lab 12", "Lab 13", "Lab 14"],
    ),
    Exam(
      name: "Biznis i menadzhment",
      dateTime: DateTime(2025, 11, 18, 8, 30),
      rooms: ["Lab 12", "Lab 13"],
    ),
    Exam(
      name: "Marketing",
      dateTime: DateTime(2026, 1, 5, 15, 30),
      rooms: ["Lab 138", "Lab 215"],
    ),
    Exam(
      name: "Diskretna matematika",
      dateTime: DateTime(2025, 12, 1, 11, 25),
      rooms: ["Lab 138", "Lab 200 AB", "Lab 215"],
    ),
    Exam(
      name: "Biznis statistika",
      dateTime: DateTime(2025, 12, 15, 9, 0),
      rooms: ["Lab 138", "Lab 2", "Lab 3"],
    ),
    Exam(
      name: "Kompjuterska grafika",
      dateTime: DateTime(2025, 10, 28, 9, 15),
      rooms: ["Lab 117", "Lab 200 AB"],
    ),
    Exam(
      name: "Analiza i dizajn",
      dateTime: DateTime(2025, 11, 27, 13, 50),
      rooms: ["Lab 215", "Lab 315"],
    ),
    Exam(
      name: "Softversko inzhenjerstvo",
      dateTime: DateTime(2025, 12, 7, 17, 40),
      rooms: ["Lab 117", "Lab 3"],
    ),
    Exam(
      name: "Profesionalni veshtini",
      dateTime: DateTime(2025, 11, 22, 19, 15),
      rooms: ["Lab 13", "Lab 14"],
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Raspored na ispiti - 213163")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...(exams..sort((a, b) => a.dateTime.compareTo(b.dateTime)))
                  .map(
                    (exam) => CardExam(
                      exam: exam,
                      onTapAction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenDetails(exam: exam),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
              SizedBox(height: 12,),
              Stack(
                children: [
                  Icon(Icons.sticky_note_2_outlined, size: 32),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${exams.length}',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}
