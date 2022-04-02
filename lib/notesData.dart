class notesData {
  String? noteID;
  String? noteTitle;
  DateTime? createDateTime;
  DateTime? latestEditDateTime;

  notesData(
      {this.noteID,
      this.noteTitle,
      this.createDateTime,
      this.latestEditDateTime});

  factory notesData.fromJson(Map<String, dynamic> json) {
    return notesData(
        noteID: json['noteID'],
        noteTitle: json['noteTitle'],
        createDateTime: DateTime.parse(json['createDateTime']),
        latestEditDateTime: DateTime.parse(json['latestEditDateTime']));
  }

  static List<notesData> notesList(List snapshot) {
    return snapshot.map((notes) {
      return notesData.fromJson(notes);
    }).toList();
  }
}

// @override
// String toString() {
//   return 'Recipe {, image: $images, rating: $rating, totalTime: $totalTime}';
// }
// }
