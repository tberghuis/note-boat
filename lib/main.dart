import 'package:flutter/material.dart';
import 'package:notes/screens/note_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Boat',
      home: NoteListScreen(),
    );
  }
}
