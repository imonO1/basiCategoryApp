// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class DetailsItems extends StatelessWidget {
  const DetailsItems({
    Key? key,
    required this.name,
    required this.descrip,
    required this.img,
    required this.nmbr,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final name, descrip, img;
  final int nmbr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              Text(
                '$nmbr.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Divider(
                color: Color.fromARGB(255, 10, 1, 1),
              ),
              Text(
                descrip,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
