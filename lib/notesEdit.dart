import 'package:flutter/material.dart';
import 'package:flutter_apis/notesData.dart';

class edit extends StatelessWidget {
  const edit({Key? key, required this.data}) : super(key: key);

  final notesData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.noteID!.isEmpty ? "Create Note" : "Edit Note ${data.noteID}"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter title"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Enter Description",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
