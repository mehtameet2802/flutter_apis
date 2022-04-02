import 'package:flutter/material.dart';
import 'package:flutter_apis/models/ApiResponse.dart';
import 'package:flutter_apis/noteDelete.dart';
import 'package:flutter_apis/notesCard.dart';
import 'package:flutter_apis/notesData.dart';
import 'package:flutter_apis/models/apis.dart';
import 'notesEdit.dart';

class notesList extends StatefulWidget {
  const notesList({Key? key}) : super(key: key);

  @override
  State<notesList> createState() => _notesListState();
}

class _notesListState extends State<notesList> {
  ApiResponse<List<notesList>>? notes;
  bool isLoading = true;

  @override
  void initState() {
    fetchNotes();
    super.initState();
  }

  fetchNotes() async{
    setState(() {
      isLoading = true;
    });

    notes = (await apis.getNotes()) as ApiResponse<List<notesList>>?;

    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => edit(data: notesData(noteID: ""))));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
              itemCount: notes!.data!.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    color: Colors.redAccent,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  key: ValueKey(),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (context) => noteDelete());
                    print(result);
                    return result;
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => edit(data: notes!.data![index])));
                    },
                    child: notesCard(
                      id: notes!.data![index].noteID,
                      title: notes[index].noteTitle,
                      create: notes[index].createDateTime,
                      edited: notes[index].latestEditDateTime,
                    ),
                  ),
                );
              }),
    );
  }
}
