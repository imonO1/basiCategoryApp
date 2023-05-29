// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, must_be_immutable
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.image,
    required this.name,
    required this.onClick,
  }) : super(key: key);

  final String name, image;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onClick,
        child: Card(
          color: Colors.blue,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(
                        10,
                      )),
                  // ignore: prefer_const_constructors
                  image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
