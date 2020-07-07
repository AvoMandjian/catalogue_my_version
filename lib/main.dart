import 'dart:convert';

import 'package:catalogue_my_version/MediaQuery.dart';
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
                category: 'Ruby',
              ),
              buildFutureBuilder(context, jsonFileName: 'Ruby'),
              TextCustom(
                category: 'Amethyst',
              ),
              buildFutureBuilder(context, jsonFileName: 'Amethyst'),
              TextCustom(
                category: 'Emerald',
              ),
              buildFutureBuilder(context, jsonFileName: 'Emerald'),
              TextCustom(
                category: 'Sapphire',
              ),
              buildFutureBuilder(context, jsonFileName: 'Sapphire'),
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
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              height: displayHeight(context) * 0.9,
              child: SingleChildScrollView(
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
              ),
            );
          }),
      child: Card(
        child: Image.asset(
          myData[index]['image'],
          width: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
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
