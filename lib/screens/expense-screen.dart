import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:test_flutthe/models/expenditure.dart';
import '../dialogs/confirm-dialog.dart';
import '../dialogs/edit-dialog.dart';
import '../mongo.dart';

class ExpenseState extends StatefulWidget {

  const ExpenseState({super.key});

  @override
  State<ExpenseState> createState() => ExpenseScreen();
}

class ExpenseScreen extends State<ExpenseState> {

  List<Expenditure> expenditures = List.empty();

  final Mongo mongoDatabase = Mongo();

  @override
  void initState() {
    mongoDatabase.connect().then((success) {
      mongoDatabase.fetchExpenditures().then((data) {
        setState(() {
          this.expenditures = data;
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    mongoDatabase.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Expenditures"),
        ),
        body: ListView.separated(
          itemCount: expenditures.length,
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1,
              color: Colors.grey,
            );
          },
          itemBuilder: (context, index) {
            return ExpandablePanel(
              header: Text(expenditures.elementAt(index).amount.toString() + "€"),
              collapsed: Text(expenditures.elementAt(index).date.toString()),
              expanded:
              Wrap(
                spacing: 5,
                children: [
                  EditDialog(objectToEdit: expenditures.elementAt(index)),
                  //TextButton(
                  //    style: TextButton.styleFrom(
                  //      foregroundColor: Colors.white,
                  //      backgroundColor: Colors.black,
                  //    ),
                  //    onPressed: () {
                  //    },
                  //    child: Text("Edit")
                  //),
                  ConfirmDialog(
                      onConfirm: () {

                      }
                  ),
                ],
              ),

              //title:
              //onTap: () {
//
              //},
            );
          },
        ),
        //floatingActionButton: FloatingActionButton(
        //  onPressed: () => showDialog<String>(
        //    context: context,
        //    builder: (BuildContext context) => Dialog(
        //      child: Padding(
        //          padding: const EdgeInsets.all(8.0),
        //          child: CategoryFormState(edit: false)
        //      ),
        //    ),
        //  ),
        //  backgroundColor: Colors.black,
        //  tooltip: 'Increment',
        //  child: const Icon(Icons.add),
        //  //child: EditDialogExample(),
        //)
    );
  }
}