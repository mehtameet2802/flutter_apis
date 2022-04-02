class note {
  String? noteID;
  String? noteTitle;
  String? noteContent;
  DateTime? createDateTime;
  DateTime? latestEditDateTime;

  note(
      {this.noteID,
      this.noteTitle,
      this.noteContent,
      this.createDateTime,
      this.latestEditDateTime});

  factory note.fromJson(Map<String, dynamic> json) {
    return note(
        noteID: json['noteID'] as String,
        noteTitle: json['noteTitle'] as String,
        noteContent: json['noteContent'] as String,
        createDateTime: json['createDateTime'] == null
            ? null
            : DateTime.parse(json['createDateTime'].toString()),
        latestEditDateTime: json['latestEditDateTime'] == null
            ? null
            : DateTime.parse(json['latestEditDateTime'].toString()));
  }

  Map<String, dynamic> toJson(note instance) => <String, dynamic>{
        'noteID': instance.noteID,
        'noteTitle': instance.noteTitle,
        'noteContent': instance.noteContent,
        'createDateTime': instance.createDateTime?.toIso8601String(),
        'latestEditDateTime': instance.latestEditDateTime?.toIso8601String(),
      };

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['noteID'] = this.noteID;
//   data['noteTitle'] = this.noteTitle;
//   data['noteContent'] = this.noteContent;
//   data['createDateTime'] = this.createDateTime;
//   data['latestEditDateTime'] = this.latestEditDateTime;
//   return data;
// }
}
