// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code, unused_local_variable

import 'package:categoryapp/app/data/info_data.dart';
import 'package:categoryapp/app/model/models.dart';
import 'package:categoryapp/app/screens/listItemPage.dart';
import 'package:flutter/material.dart';

import '../widgets/itemCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final datainfo = InfoData();
  List<MyModel> category = [];
  List<MyModel> flower = [];
  List<MyModel> fillterFlower = [];
  List<MyModel> fruit = [];
  List<MyModel> fillterFruit = [];
  List<MyModel> fish = [];
  List<MyModel> fillterFish = [];
  List<MyModel> bird = [];
  List<MyModel> fillterBird = [];

  getItem() {
    for (var item in datainfo.categories) {
      var things = MyModel.fromJson(item);
      category.add(things);
    }

    flower.clear();
    fillterFlower.clear();
    for (var item in datainfo.flowers) {
      var things = MyModel.fromJson(item);
      fillterFlower.add(things);
      flower.add(things);
    }

    fruit.clear();
    fillterFruit.clear();
    for (var item in datainfo.fruits) {
      var things = MyModel.fromJson(item);
      fruit.add(things);
      fillterFruit.add(things);
    }

    fish.clear();
    fillterFish.clear();
    for (var item in datainfo.fishes) {
      var things = MyModel.fromJson(item);
      fish.add(things);
      fillterFish.add(things);
    }

    bird.clear();
    fillterBird.clear();
    for (var item in datainfo.birds) {
      var things = MyModel.fromJson(item);
      bird.add(things);
      fillterBird.add(things);
    }
    setState(() {});
  }

  @override
  void initState() {
    getItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            CategoryItem(
                image:
                    'https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg',
                name: 'Flower',
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListPage(
                            itemList: flower,
                            fillteredList: fillterFlower,
                          )));
                }),
            CategoryItem(
                image: 'https://thumbs.dreamstime.com/b/fruit-2999796.jpg',
                name: 'Fruit',
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListPage(
                            itemList: fruit,
                            fillteredList: fillterFruit,
                          )));
                }),
            CategoryItem(
                image:
                    'https://news.stanford.edu/wp-content/uploads/2020/10/Birds_Culture-1-copy.jpg',
                name: 'Bird',
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListPage(
                            itemList: bird,
                            fillteredList: fillterBird,
                          )));
                }),
            CategoryItem(
                image:
                    'https://images.pexels.com/photos/45910/goldfish-carassius-fish-golden-45910.jpeg?auto=compress&cs=tinysrgb&w=600',
                name: 'Bird',
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListPage(
                            itemList: fish,
                            fillteredList: fillterFish,
                          )));
                }),
          ],
        ),
      ),
    );
  }
}
