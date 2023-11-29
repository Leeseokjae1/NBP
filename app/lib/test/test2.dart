import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'main'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _curIndex=0; 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: getPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        iconSize: 30,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        currentIndex: _curIndex,
        onTap: (index){
          setState(() {
            _curIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      )
    );
  }
  Widget getPage(){
    Widget? page;
    switch(_curIndex){
      case 0:
      page = page1();
      break;
      case 1:
      page = page2();
      break;
      case 2:
      page = page3();
      break;
    }
    return page!;
  }

  Widget page1(){
    return Container(
      height: 200,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              color:Colors.red,
              size:50.0,
            ),
            Text('Page index: 0', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
  Widget page2(){
    return Container(
      height: 200,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              color:Colors.orange,
              size:50.0,
            ),
            Text('Page index: 1', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
  Widget page3(){
    return Container(
      height: 200,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications,
              color:Colors.blue,
              size:50.0,
            ),
            Text('Page index: 2', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}