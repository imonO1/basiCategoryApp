// ignore_for_file: prefer_const_constructors, file_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable
import 'package:flutter/material.dart';

class ItemForList extends StatelessWidget {
  ItemForList({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.onclicked,
  }) : super(key: key);
  final String name, image, description;

  VoidCallback onclicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclicked,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15),
        ),
        // color: Colors.blueAccent,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      // color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        //textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
