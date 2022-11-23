import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/details.dart';
import 'package:counter_7/model/model.dart';
import 'package:flutter/material.dart';


class WatchListPage extends StatefulWidget {
    const WatchListPage({super.key});

    @override
    _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
    Future<List<WatchList>> fetchWatchList() async {
        var url = Uri.parse('https://pbp-asg2.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
        url,
        headers: {
            "Content-Type": "application/json",
        },
        );

        // decode the response into the json form
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // convert the json data into WatchList object
        List<WatchList> listWatchList = [];
        for (var d in data) {
            if (d != null) {
                listWatchList.add(WatchList.fromJson(d));
            }
        }

        return listWatchList;
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Watch List'),
            ),
            drawer: DrawerWidget(),
            body: FutureBuilder(
                future: fetchWatchList(),
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
                                                            child: Icon(
                                                                Icons.local_movies_outlined,
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

