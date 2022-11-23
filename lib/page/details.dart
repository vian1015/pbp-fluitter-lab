import 'package:counter_7/model/model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.movie});

  final WatchList movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: Container(
            child: ListView(
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                children: <Widget>[
                    Center(
                        child: Text(
                            movie.fields.title,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                    ),
                    SizedBox(height: 20),
                    DataTable(
                        headingRowHeight: 0,
                        columns:const <DataColumn> [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                        ],
                        rows: <DataRow> [
                            DataRow(
                                cells: <DataCell>[
                                    DataCell(Text('Release Date', style: TextStyle(fontWeight: FontWeight.bold))),
                                    DataCell(Text(movie.fields.releaseDate)),
                                ],
                            ),
                            DataRow(
                                cells: <DataCell>[
                                    DataCell(Text('Rating', style: TextStyle(fontWeight: FontWeight.bold))),
                                    DataCell(Text('${movie.fields.rating} / 5')),
                                ],
                            ),
                            DataRow(
                                cells: <DataCell>[
                                    DataCell(Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                                    DataCell(Text(movie.fields.watched ? "Watched" : "Not Watched")),
                                ],
                            ),
                            DataRow(
                                cells: <DataCell>[
                                    DataCell(Text('Review', style: TextStyle(fontWeight: FontWeight.bold))),
                                    DataCell(Text(movie.fields.review)),
                                ],
                            ),
                        ],
                    ),
                ],
            ),
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Padding(
                padding: EdgeInsets.all(12.0),
                child:TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                        Navigator.pop(context);
                    }
                ),
            ),
        ),
    );
  }
}