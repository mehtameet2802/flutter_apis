import 'package:flutter_apis/models/ApiResponse.dart';
import 'package:flutter_apis/models/note.dart';
import 'package:flutter_apis/models/notesList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class apis {
  static const baseApi = "https://tq-notes-api-jkrgrdggbq-el.a.run.app/";
  static const header = {
    'apiKey': '4c3e385e-b650-49ec-8668-1184ece287c2',
    'Content-Type': 'application/json'
  };

  static Future<ApiResponse<List<notesList>>> getNotes() {
    return http.get(Uri.parse(baseApi + '/notes'), headers: header).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final notes = <notesList>[];
        for(var item in jsonData){
          notes.add(notesList.fromJson(item));
        }
        return ApiResponse<List<notesList>>(data: notes);
      }
      return ApiResponse<List<notesList>>(error: true,errorMessage: 'Some error occured');
    }).catchError((e) => ApiResponse<List<notesList>>(error: true,errorMessage: e.toString()));
  }

  static Future<ApiResponse<note>> getNote(String noteID){
    return http.get(Uri.parse(baseApi+'/notes/'+noteID),headers: header).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
        return ApiResponse<note>(data: note.fromJson(jsonData));
      }
      return ApiResponse<note>(error: true, errorMessage: 'An error occured');
    }).catchError((e)=> ApiResponse<note>(error:true,errorMessage: e.toString()));
  }

}