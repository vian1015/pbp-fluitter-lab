import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/model.dart';
import 'package:flutter/material.dart';

class MyDataPage extends StatefulWidget {
    const MyDataPage({super.key});

    @override
    State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Budget Data'),
            ),
            drawer: DrawerWidget(),
            body: Center(
                child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.separated(
                        padding: const EdgeInsets.all(12.0),
                        itemCount: User.budgetData.length,
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
                                                right: new BorderSide(width: 1.0, color: Colors.grey))
                                            ),
                                            child: Icon(
                                                Icons.attach_money, 
                                                color: User.budgetData[index].type == 'Income' ? Colors.green : Colors.red,
                                            ),
                                        ),
                                        title: Text(
                                            User.budgetData[index].title!,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        isThreeLine: true,
                                        subtitle: RichText(
                                            text: TextSpan(children: [
                                                TextSpan(
                                                    text: User.budgetData[index].type == 'Income' ? '+' : '-',
                                                    style: TextStyle(
                                                        color: User.budgetData[index].type == 'Income' ? Colors.green : Colors.red,
                                                    ),
                                                ),
                                                TextSpan(
                                                    text: ' \$${User.budgetData[index].amount} \n',
                                                    style: TextStyle(
                                                        color: User.budgetData[index].type == 'Income' ? Colors.green : Colors.red,
                                                    ),
                                                ),
                                                TextSpan(
                                                    text: User.budgetData[index].date!,
                                                    style: TextStyle(
                                                        color: Colors.grey, 
                                                        fontSize: 12, 
                                                        fontStyle: FontStyle.italic
                                                    ),
                                                ),
                                            ]),
                                        ),
                                    ),
                                ),
                            );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider()
                    ),
                ),
            ),
        );
    }
}