class notesList {
  String? noteID;
  String? noteTitle;
  DateTime? createDateTime;
  DateTime? latestEditDateTime;

  notesList(
      {required this.noteID,
      required this.noteTitle,
      required this.createDateTime,
      required this.latestEditDateTime});

  factory notesList.fromJson(Map<String, dynamic> json) {
    return notesList(
        noteID: json['noteID'] as String,
        noteTitle: json['noteTitle'] as String,
        createDateTime: json['createDateTime'] == null
            ? null
            : DateTime.parse(json['createDateTime'].toString()),
        latestEditDateTime: json['latestEditDateTime'] == null
            ? null
            : DateTime.parse(json['latestEditDateTime'].toString()));
  }

  Map<String, dynamic> toJson(notesList instance) => <String, dynamic>{
    'noteID': instance.noteID,
    'noteTitle': instance.noteTitle,
    'createDateTime': instance.createDateTime?.toIso8601String(),
    'latestEditDateTime': instance.latestEditDateTime?.toIso8601String(),
  };

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['noteID'] = this.noteID;
//   data['noteTitle'] = this.noteTitle;
//   data['createDateTime'] = this.createDateTime;
//   data['latestEditDateTime'] = this.latestEditDateTime;
//   return data;
// }
}
