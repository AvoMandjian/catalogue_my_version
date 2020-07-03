import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stones'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextCustom(
                category: 'red',
              ),
              buildFutureBuilder(context, jsonFileName: 'Red'),
              TextCustom(
                category: 'Purple',
              ),
              buildFutureBuilder(context, jsonFileName: 'Purple'),
              TextCustom(
                category: 'Green',
              ),
              buildFutureBuilder(context, jsonFileName: 'Green'),
              TextCustom(
                category: 'Blue',
              ),
              buildFutureBuilder(context, jsonFileName: 'Blue'),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildFutureBuilder(BuildContext context,
      {@required String jsonFileName}) {
    return SizedBox(
      height: 200.0,
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/JsonFiles/$jsonFileName.json'),
        builder: (context, snapshot) {
          var myData = json.decode(snapshot.data.toString());
          return ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: myData == null ? 0 : myData.length,
            itemBuilder: (context, index) {
              return gestureDetectorCustom(context, myData, index);
            },
          );
        },
      ),
    );
  }

  GestureDetector gestureDetectorCustom(
      BuildContext context, myData, int index) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(myData[index]['name']),
                  Image.asset(
                    myData[index]['image'],
                    height: 300,
                  ),
                  Text(myData[index]['description'])
                ],
              ),
            );
          }),
      child: Card(
        child: Image.asset(
          myData[index]['image'],
        ),
      ),
    );
  }
}

class TextCustom extends StatelessWidget {
  String category;
  TextCustom({@required this.category});

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: TextStyle(fontSize: 18),
    );
  }
}
