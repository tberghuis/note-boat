class Note {
  int noteId;
  String noteText;
  DateTime createdDate;
  DateTime modifiedDate;

  // ??? assert noteId != null etc
  Note({this.noteId, this.noteText, this.modifiedDate, this.createdDate}) {}

  Note.create() {
    noteText = "";
    createdDate = DateTime.now();
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (noteId != null) {
      map['note_id'] = noteId;
    }
    map['note_text'] = noteText;
    map['modified_date'] = modifiedDate.toIso8601String();
    map['created_date'] = createdDate.toIso8601String();
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      noteId: map['note_id'],
      noteText: map['note_text'],
      modifiedDate: DateTime.parse(map['modified_date']),
      createdDate: DateTime.parse(map['created_date']),
    );
  }
}
