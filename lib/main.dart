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
              Text(
                'Red',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 200.0,
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/JsonFiles/Red.json'),
                  builder: (context, snapshot) {
                    var myData = json.decode(snapshot.data.toString());
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: myData == null ? 0 : myData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  children: [
                                    Text(myData[index]['name']),
                                    Image.asset(
                                      myData[index]['image'],
                                      height: 300,
                                    ),
                                    Text(myData[index]['description'])
                                  ],
                                );
                              }),
                          child: Card(
                            child: Image.asset(
                              myData[index]['image'],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Text(
                'Purple',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 200.0,
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/JsonFiles/Purple.json'),
                  builder: (context, snapshot) {
                    var myData = json.decode(snapshot.data.toString());
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: myData == null ? 0 : myData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Image.asset(
                            myData[index]['image'],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Text(
                'Green',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 200.0,
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/JsonFiles/Green.json'),
                  builder: (context, snapshot) {
                    var myData = json.decode(snapshot.data.toString());
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: myData == null ? 0 : myData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Image.asset(
                            myData[index]['image'],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Text(
                'Blue',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 200.0,
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/JsonFiles/Blue.json'),
                  builder: (context, snapshot) {
                    var myData = json.decode(snapshot.data.toString());
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: myData == null ? 0 : myData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Image.asset(
                            myData[index]['image'],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
