// ignore_for_file: prefer_const_constructors, file_names, prefer_const_constructors_in_immutables, unnecessary_this, no_logic_in_create_state, prefer_typing_uninitialized_variables, empty_constructor_bodies, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, unused_local_variable

import 'package:categoryapp/app/model/models.dart';
import 'package:categoryapp/app/screens/detailsPage.dart';
import 'package:flutter/material.dart';
import '../widgets/listItems.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key, required this.itemList, required this.fillteredList})
      : super(key: key);

  final List<MyModel> itemList;
  final List<MyModel> fillteredList;
  @override
  State<ListPage> createState() => _ListPageState(
      itemList: this.itemList, fillteredList: this.fillteredList);
}

class _ListPageState extends State<ListPage> {
  _ListPageState({
    required this.itemList,
    required this.fillteredList,
  });
  final List<MyModel> fillteredList;
  final List<MyModel> itemList;
  searchItem(String key) {
    List<MyModel> result = [];
    if (key.isEmpty) {
      result = itemList;
    } else {
      result = itemList
          .where((element) =>
              element.name!.toLowerCase().contains(key.trim().toLowerCase()) ||
              element.description!
                  .toLowerCase()
                  .contains(key.trim().toLowerCase()))
          .toList();
    }
    if (fillteredList.isNotEmpty) {
      fillteredList.clear();
      fillteredList.addAll(result);
    } else {
      fillteredList.addAll(result);
    }
    setState(() {});
  }

  bool search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: search
            ? TextFormField(
                style: TextStyle(
                  fontSize: 14,
                ),
                onChanged: (val) {
                  searchItem(val);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search Item',
                    suffixIcon: IconButton(
                        onPressed: (() {
                          setState(() {
                            search = false;
                          });
                        }),
                        icon: Icon(Icons.close))),
              )
            : Text('All Items'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  search = true;
                });
              },
              icon: search ? Container() : Icon(Icons.search))
        ],
      ),
      body: SafeArea(
          child: fillteredList.isNotEmpty
              ? ListView(
                  children: List.generate(fillteredList.length, (index) {
                    var item = fillteredList[index];
                    return ItemForList(
                      onclicked: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              nmbr: item.id as int,
                              descrip: item.description ?? '',
                              img: item.image ?? '',
                              name: item.name ?? '',
                            ),
                          ),
                        );
                      },
                      description: item.description ?? '',
                      name: item.name ?? '',
                      image: item.image ?? '',
                    );
                  }),
                )
              : Center(
                  child: Text(
                    'No Data Found :( ....',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                )),
    );
  }
}
