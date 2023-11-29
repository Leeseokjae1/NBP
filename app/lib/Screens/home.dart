import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:yws/Screens/map.dart';
import 'package:yws/Screens/webview.dart';
import 'package:url_launcher/url_launcher_string.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Person> persons;
  String json = '''
    {"items": {"item": 
                [
                  {"name":"한국고고학사전","icon":"assets/icons/icon_book.png","href":"https://portal.nrich.go.kr/kor/archeologyTotalList.do?menuIdx=567"},
                  {"name":"한국고고학저널","icon":"assets/icons/icon_brush.png","href":"https://portal.nrich.go.kr/kor/journalList.do?menuIdx=570"},
                  {"name":"북방 고고연구","icon":"assets/icons/icon_earth.png","href":"https://portal.nrich.go.kr/kor/page.do?menuIdx=1096"},
                  {"name":"문화유산 수리","icon":"assets/icons/icon_repair.png","href":"https://portal.nrich.go.kr/kor/chronologyUsrList.do?menuIdx=596"},
                  {"name":"부석사 조사당 벽화 VR","icon":"assets/icons/icon_Hanok.png","href":"https://vrart.nrich.kr/buseoksa/"},
                  {"name":"한국의 금석문","icon":"assets/icons/icon_gravestone.png","href":"https://portal.nrich.go.kr/kor/page.do?menuIdx=1171"},
                  {"name":"한국의 목간","icon":"assets/icons/icon_books.png","href":"https://portal.nrich.go.kr/kor/page.do?menuIdx=1179"},
                  {"name":"한국의 전통문양","icon":"assets/icons/icon_pattern.png","href":"https://portal.nrich.go.kr/kor/designUsrList.do?menuIdx=589"},
                  {"name":"한국의 괘불","icon":"assets/icons/icon_buddha.png","href":"https://portal.nrich.go.kr/kor/page.do?menuIdx=1189"},
                  {"name":"조선왕릉 디지털백과","icon":"assets/icons/icon_gravestone2.png","href":"https://royaltomb.nrich.go.kr/"}
                ]
              }
    }''';

  @override
  void initState() {
    super.initState();
    persons = [];

    getDatas();
    setState(() {});
  }

  Future<void> getDatas() async {
    var data1 = jsonDecode(json);
    List data2 = data1['items']['item'];
    for (int i2 = 0; i2 < data2.length; i2++) {
      persons
          .add(Person(data2[i2]["name"], data2[i2]["icon"], data2[i2]["href"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/bg2.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: const BoxDecoration(
                // color: Color.fromRGBO(19, 99, 164, 1),
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 340,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: const Color.fromRGBO(250, 250, 250, 0.1),
                        child: IconButton(
                          iconSize: 30,
                          color: Colors.white,
                          icon: const Icon(Icons.notification_add_outlined),
                          onPressed: () {
                             _launchURL("https://youtube.com/@koreanheritage?sub_confirmation=1");
                          },
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 35, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '국립문화재연구원',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 224, 223, 223),
                          ),
                        ),
                        Text(
                          '문화유산 지식e음',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 120,
          left: 20,
          child: Container(
            height: 170,
            width: 372,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 57, 100, 0.3),
                  offset: Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: 6,
                ),
              ],
              color: const Color.fromRGBO(0, 57, 100, 1),
              image: const DecorationImage(
                image: AssetImage('assets/images/report.jpg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.2),
                  BlendMode.darken,
                ),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const webview(href: "https://portal.nrich.go.kr/kor/originalUsrView.do?menuIdx=1046&info_idx=8916")));
              },
              child: const Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '최신 연구성과',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          '공주 무령왕릉과 왕릉원',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  ' -29호분 발굴조사 보고서-',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 216, 216, 216),
                                  ),
                                ),
                                Text(
                                  '저작물은 공공누리 제 4유형 출처표시+상업적 이용금지',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 320,
          left: 20,
          child: Container(
            height: 470,
            width: 372,
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 열의 수
                mainAxisSpacing: 10.0, // 수직 간격
                crossAxisSpacing: 10.0, // 수평 간격
                childAspectRatio: 1.2, // 아이템의 가로 세로 비율
              ),
              itemCount: persons.length,
              itemBuilder: (BuildContext context, int index) {
                return PersonTile(persons[index], index);
              },
            ),
          ),
        )
      ],
    );
  }
  _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Person {
  String name;
  String icon;
  String href;

  Person(this.name, this.icon, this.href);
}

class PersonTile extends StatelessWidget {
  final Person _person;
  final int index;
  PersonTile(this._person, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    webview(href: _person.href)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // 그림자 색상 설정
              spreadRadius: 5, // 그림자의 확산 범위
              blurRadius: 7, // 그림자의 흐림 정도
              offset: const Offset(0, 3), // 그림자의 위치 (수평, 수직)
            ),
          ], // 테두리 스타일
          borderRadius: BorderRadius.circular(10), // 테두리 둥글기 설정
        ),
        child: Column(
          children: [
            Image.asset(
              _person.icon,
            ),
            Text(
              _person.name,
            ),
          ],
        ),
      ),
    );
  }
}
