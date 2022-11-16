import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();
    TextEditingController dateController = TextEditingController();
    String? _budgetTitle;
    int? _budgetAmount;
    String? _typeChoosen;
    List<String> _typeList = ["Income", "Expense"];
    String? _datePicked;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Add Budget Info'),
            ),
            drawer: DrawerWidget(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            children: [
                                Padding(
                                    // Using padding of 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Input title here ...",
                                            labelText: "Title",
                                            // Added a circular border to make it neater
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Added behavior when name is typed 
                                        onChanged: (String? value) {
                                            setState(() {
                                                _budgetTitle = value!;
                                            });
                                        },
                                        // Added behavior when data is saved
                                        onSaved: (String? value) {
                                            setState(() {
                                                _budgetTitle = value!;
                                            });
                                        },
                                        // Validator as form validation
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Title cannot be empty!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    // Using padding of 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                            hintText: "Input amount here ...",
                                            labelText: "Amount",
                                            // Added a circular border to make it neater
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Added behavior when name is typed 
                                        onChanged: (String? value) {
                                            setState(() {
                                                _budgetAmount = int.parse(value!);
                                            });
                                        },
                                        // Added behavior when data is saved
                                        onSaved: (String? value) {
                                            setState(() {
                                                _budgetAmount = int.parse(value!);
                                            });
                                        },
                                        // Validator as form validation
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Amount cannot be empty!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    // Using padding of 8 pixels
                                    padding: const EdgeInsets.all(12.0),
                                    child: DropdownButtonFormField(
                                        hint: const Text('Choose Type'),
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items: _typeList.map((String items) {
                                        return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                        );
                                        }).toList(),
                                        value: _typeChoosen,
                                        onChanged: (String? newValue) {
                                            setState(() {
                                                _typeChoosen = newValue!;
                                            });
                                        },
                                        onSaved: (String? newValue) {
                                            setState(() {
                                                _typeChoosen = newValue!;
                                            });
                                        },
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Please choose a type!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    // Using padding of 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        controller: dateController,
                                        decoration: const InputDecoration(
                                            icon: Icon(Icons.calendar_today),
                                            labelText: "Date",
                                            hintText: "Enter Date",
                                        ),
                                        readOnly: true,
                                        onTap: () async{
                                            DateTime? pickedDate = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2023),
                                            );
                                            if(pickedDate != null){
                                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                                setState(() {
                                                    dateController.text = formattedDate;
                                                    _datePicked = formattedDate;
                                                });
                                            };
                                        },
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Please pick a date!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
            bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: TextButton(
                    child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            User.budgetData.add(
                                BudgetData(_budgetTitle, _budgetAmount, _typeChoosen, _datePicked)
                            );
                            showDialog(
                                context: context,
                                builder: (context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: Container(
                                    child: ListView(
                                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                            Center(child: const Text('Data Saved Succesfully!')),
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
                                                            DataCell(Text('Title: ')),
                                                            DataCell(Text(_budgetTitle!)),
                                                        ],
                                                    ),
                                                    DataRow(
                                                        cells: <DataCell>[
                                                            DataCell(Text('Amount: ')),
                                                            DataCell(Text('${_budgetAmount!}')),
                                                        ],
                                                    ),
                                                    DataRow(
                                                        cells: <DataCell>[
                                                            DataCell(Text('Type: ')),
                                                            DataCell(Text(_typeChoosen!)),
                                                        ],
                                                    ),
                                                    DataRow(
                                                        cells: <DataCell>[
                                                            DataCell(Text('Date: ')),
                                                            DataCell(Text(_datePicked!)),
                                                        ],
                                                    ),
                                                ],
                                            ),
                                            SizedBox(height: 10),
                                            // TODO: Display the information obtained from the form
                                            TextButton(
                                                onPressed: () {
                                                Navigator.pop(context);
                                                },
                                                child:
                                                    Text('Close'),
                                            ), 
                                        ],
                                    ),
                                    ),
                                );
                                },
                            );
                        }
                    },
                ),
            ),
        );
    }
}