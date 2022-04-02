import 'package:flutter/material.dart';

class ReciepeCard extends StatelessWidget {
  String? title;
  String? rating;
  String? cookTime;
  String? thumbnailUrl;

  ReciepeCard({this.title, this.rating, this.cookTime, this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.grey,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage((thumbnailUrl!))),
                ),
              ),
              Center(
                  child: Text(
                title!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.3)),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 3, top: 1, bottom: 1),
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          rating!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: 85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.3)),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 3, top: 1, bottom: 1),
                          child: Icon(
                            Icons.timer,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          cookTime!,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
