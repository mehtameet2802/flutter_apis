import 'package:flutter/material.dart';
import 'package:flutter_apis/reciepeCard.dart';

class reciepe extends StatefulWidget {
  const reciepe({Key? key}) : super(key: key);

  @override
  State<reciepe> createState() => _reciepeState();
}

class _reciepeState extends State<reciepe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ReciepeCard(title:"Hello",rating: "3.0",cookTime: "1 hour",thumbnailUrl: ""),
            Icon(Icons.restaurant_menu),
            Text("Reciepe Book")
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ReciepeCard(
                title: "Hello",
                cookTime: "1 hour",
                rating: "3.0",
                thumbnailUrl: "");
          }),
    );
  }
}
