// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yws/Screens/map.dart';
import 'package:yws/Screens/home.dart';
import 'package:yws/Screens/webview.dart';
import 'package:yws/Screens/search.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
  List Screen = [
    const Home(),
    const map1(),
    const saerchHome(),
    const webview(href: "https://m.youtube.com/@koreanheritage/videos")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const webview(href: "https://portal.nrich.go.kr/kor/index.do")));
          },
          backgroundColor: const Color.fromRGBO(0, 57, 100, 1),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.public,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 55,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0
                      ? const Color.fromRGBO(0, 57, 100, 1)
                      : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.map,
                  size: 30,
                  color: index_color == 1
                      ? const Color.fromRGBO(0, 57, 100, 1)
                      : Colors.grey,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.screen_search_desktop_outlined,
                  size: 30,
                  color: index_color == 2
                      ? const Color.fromRGBO(0, 57, 100, 1)
                      : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.play_circle,
                  size: 30,
                  color: index_color == 3
                      ? const Color.fromRGBO(0, 57, 100, 1)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
