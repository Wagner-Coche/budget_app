import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            floating: true,
            pinned: false,
            expandedHeight: 75,
            leading: IconButton(
              onPressed: () {}, 
              icon: const Icon(
                Icons.settings, 
                size: 26,
              )
            ),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                "Simple Budget",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              centerTitle: true,
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {}, 
                icon: const Icon(
                  Icons.add, 
                  size: 26,
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: 100,
                  color: Colors.red,
                );
              },
              childCount: 10
            )
          )
        ],
      ),
    );
  }
} 