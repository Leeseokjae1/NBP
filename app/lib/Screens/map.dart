import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


LatLng add = const LatLng(37.57979551550774, 126.97706246296076);
String name = "";
String mcc =
    "조선 高宗 6년(1869)에 충남 천안에서 태어난 독립운동가로 號는 石吾이다. 1904년 제1차 韓日協約이 체결되자 尙洞 靑年會에 가입하여 계몽운동에 투신했고 1905년 을사조약이 맺어지자 북간도로 건너갔다가 귀국하여 金九 등과 新民會를 조직하고 1909년에는 만주로 건너가 新興武官學校를 설립했다. 그 후 블라디보스톡에 가서 《海潮新聞》을 발행하여 독립정신을 양양하고 1919년에는 상해 임시정부에 가담하여 국무총리에 취임했고 1928년에 韓國獨立黨을 결성하였다. 1935년에는 韓國國民黨을 조직하였는데 1940년에 사천성에서 병사하여 임시정부 국장으로 장례하고 해방 후에 孝昌公園에 안장되었다. 1962년에 대한민국 건국공로훈장 複章이 수여되었다.";
Completer<GoogleMapController> _controller = Completer();
List<Marker> _markers = [];

class map1 extends StatefulWidget {
  const map1({super.key});

  @override
  State<map1> createState() => _map1State();
}

class _map1State extends State<map1> {
  int i = 1;
  int j = 1000;
  late List<Person> persons;
  final LatLng _myLoc1 = const LatLng(37.545059, 126.960330);

  @override
  void initState() {
    super.initState();
    persons = [];

    getXmlData();
    setMarkerData();
  }

  Future<void> getXmlData() async {
    var url = Uri.parse("https://portal.nrich.go.kr/kor/openapi.do?idx=38&firstindex=$i&recordcountperpage=$j ");
    http.Response response = await http.post(url,headers: {"Accept": "application/json"},);
    var responseBody = utf8.decode(response.bodyBytes);
    String xmlData = responseBody;
    Xml2Json xml2json = Xml2Json();
    xml2json.parse(xmlData);
    var json = xml2json.toParker();
    var data1 = jsonDecode(json);
    List data2 = data1['list']['data'];
    List<Location> locations;
    for (int i2 = 0; i2 < data2.length; i2++) {
      persons.add(Person(data2[i2]['md_data3'], data2[i2]['md_data6'],data2[i2]['md_data12']));
      locations = await locationFromAddress(data2[i2]['md_data6']);
      _markers.add(Marker(
        markerId: MarkerId(data2[i2]['md_data3']),
        position: LatLng(locations[0].latitude, locations[0].longitude),
        infoWindow: InfoWindow(title: data2[i2]['md_data3'], snippet: data2[i2]['md_data12'],),
        onTap: () {
          mcc = data2[i2]['md_data12'];
        },
      ));
      setState(() {});
    }
  }

  void setMarkerData() {
    final marker1 = Marker(
      markerId: const MarkerId('A01'),
      position: _myLoc1,
      infoWindow: const InfoWindow(title: "이동녕묘",snippet: "이동녕묘입니다",),
    );
    _markers.add(marker1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 243, 244),
        title: const Text('문화유적총람'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 400,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition:
                    CameraPosition(target: _myLoc1, zoom: 15.0),
                markers: Set.from(_markers),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: const Color.fromARGB(255, 241, 243, 244),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 20,
                  ),
                  child: Text(
                    mcc,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              )),
          Expanded(
            flex: 2,
            child: ListView.separated(
              itemCount: persons.length,
              itemBuilder: (BuildContext context, int index) {
                return PersonTile(
                  persons[index],
                  index,
                  onTileTap: (String a) {
                    setState(() {
                      mcc = a;
                    });
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.black,
                  height: 1,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: right,
        tooltip: 'add',
        iconSize: 40,
        icon: const Icon(Icons.add),
      ),
    );
  }

  void set() {
    setState(() {});
  }

  void right() {
    setState(() {
      i = i + 100;
      j = j + 100;
    });
    getXmlData();
  }
}

class Person {
  String name;
  String add;
  String mcc;

  Person(this.name, this.add, this.mcc);
}

class PersonTile extends StatelessWidget {
  final Person _person;
  final int index;
  final Function(String) onTileTap;

  PersonTile(this._person, this.index, {required this.onTileTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_person.name),
      subtitle: Text('${_person.add}'),
      onTap: () {
        loc(_person.add, _person.name, _person.mcc);
        onTileTap(_person.mcc);
      },
    );
  }

  void loc(String add2, String name2, String mcc2) async {
    List<Location> locations = await locationFromAddress(add2);
    add = LatLng(locations[0].latitude, locations[0].longitude);
    name = name2;
    mcc = mcc2;
    goToLocation(LatLng(locations[0].latitude, locations[0].longitude));
  }

  Future<void> goToLocation(LatLng loc) async {
    final GoogleMapController controller = await _controller.future;
    final CameraPosition pos = CameraPosition(target: loc, zoom: 15);
    controller.animateCamera(CameraUpdate.newCameraPosition(pos));
  }
}
