import 'package:flutter/material.dart';
import 'package:sawayo_task/apiCalls.dart';
import 'package:sawayo_task/widgets/loader.dart';

import '../widgets/profileImage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  var data;
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: data == null
          ? const Loader()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    color: Colors.black,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: data == null
                        ? const Loader()
                        : SizedBox(
                            height: ht / 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: ProfileImage(
                                    text: data[index]["name"]
                                        .toString()
                                        .split('')
                                        .first,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          data[index]['name'],
                                          style: const TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${data[index]['address']['city']},",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            data[index]['address']['zipcode'],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                  ),
                );
              }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
