import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class saerchHome extends StatefulWidget {
  const saerchHome({super.key});

  @override
  State<saerchHome> createState() => _saerchHomeState();
}

class _saerchHomeState extends State<saerchHome> {
  String searchText="";
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('통합검색'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextField(
                maxLength: 50,
                maxLines: 1,
                decoration: 
                const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.greenAccent, width:1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.red, width:1.0),
                  ),
                  counterStyle: TextStyle(fontSize: 0.0, color:Colors.red),
                ),
                onChanged: (text){
                  print(text);
                },
                onSubmitted: (text){
                  print('Submitted : $text');
                  setState(() {
                    searchText = text;
                  });
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Visibility(
                visible: searchText.isNotEmpty,
                child: webview()
              ),
            )
          ],
        ),
      ),
    );
  }
  WebView webview() {
    return WebView(
      initialUrl: "https://portal.nrich.go.kr/search.do?query=$searchText",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}