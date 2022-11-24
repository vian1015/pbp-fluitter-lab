import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/details.dart';
import 'package:counter_7/page/fetch_data.dart';
import 'package:counter_7/model/model.dart';
import 'package:flutter/material.dart';


class WatchListPage extends StatefulWidget {
    const WatchListPage({super.key});

    @override
    _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
    Future? future;
    @override
    void initState() {
        future = fetchWatchList();
        super.initState();
    }
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Watch List'),
            ),
            drawer: DrawerWidget(),
            body: FutureBuilder(
                future: future,
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData) {
                            return Column(
                            children: const [
                                Text(
                                "Watch list is empty :(",
                                style: TextStyle(
                                    color: Color(0xff59A5D8),
                                    fontSize: 20),
                                ),
                                SizedBox(height: 8),
                            ],
                            );
                        } else {
                            return Center(
                                child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    child: ListView.separated(
                                        padding: const EdgeInsets.all(12.0),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (BuildContext context, int index) {
                                            return Card(
                                                elevation: 8.0,
                                                margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 1, color: snapshot.data![index].fields.watched ? Colors.blue : Colors.red)
                                                ),
                                                child: Container(
                                                    child: ListTile(
                                                        contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                                                        leading: Container(
                                                            padding: EdgeInsets.only(right: 12.0),
                                                            decoration: new BoxDecoration(
                                                                border: new Border(
                                                                    right: new BorderSide(width: 1.0, color: Colors.grey),
                                                                ),
                                                            ),
                                                            child: IconButton(
                                                                icon: Icon(
                                                                    Icons.local_movies_outlined, 
                                                                    color: snapshot.data![index].fields.watched ? Colors.blue : Colors.red 
                                                                ),
                                                                onPressed: () {
                                                                    setState(() {
                                                                        snapshot.data![index].fields.watched = !snapshot.data![index].fields.watched;
                                                                    });
                                                                },
                                                            ),
                                                        ),
                                                        title: Text(
                                                            snapshot.data![index].fields.title,
                                                            style: TextStyle(fontWeight: FontWeight.bold),
                                                        ),
                                                        onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder: (context) => DetailPage(movie: snapshot.data![index])),
                                                            );
                                                        },
                                                    ),
                                                ),
                                            );
                                        },
                                        separatorBuilder: (BuildContext context, int index) => const Divider()
                                    ),
                                ),
                            );
                        };
                    };
                },
            ),
        );
    }
}

