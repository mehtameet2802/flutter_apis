import 'package:flutter/material.dart';

class notesCard extends StatelessWidget {
  String? id;
  String? title;
  DateTime? create;
  DateTime? edited;

  notesCard({
    this.id,
    this.title,
    this.create,
    this.edited,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        color: Colors.grey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 5),
              child: Text(
                title!,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 50, bottom: 5),
              child: Text(
                "Last edited on ${edited!}",
                style: TextStyle(color: Colors.white,fontSize: 16),
              ),
            ),
            Align(),
          ],
        ),
      ),
    );
  }
}
