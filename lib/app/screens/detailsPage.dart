// ignore_for_file: prefer_const_constructors, file_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/detailsPageItem.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
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
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: DetailsItems(
          descrip: descrip,
          img: img,
          name: name,
          nmbr: nmbr,
        ),
      ),
    );
  }
}
