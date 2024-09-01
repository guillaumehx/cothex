import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:test_flutthe/dialogs/confirm-dialog.dart';
import 'package:test_flutthe/dialogs/edit-dialog.dart';
import 'package:test_flutthe/forms/category-form.dart';

import '../models/category.dart';
import '../mongo.dart';

class CategoryState extends StatefulWidget {

  const CategoryState({super.key});

  @override
  State<CategoryState> createState() => CategoryScreen();
}

class CategoryScreen extends State<CategoryState> {

  List<Category> categories = List.empty();

  final Mongo mongoDatabase = Mongo();

  @override
  void initState() {
    mongoDatabase.connect().then((success) {
      mongoDatabase.fetchCategories().then((data) {
        setState(() {
          this.categories = data;
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
        title: Text("Categories"),
      ),
      body: ListView.separated(
        itemCount: categories.length,
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1,
              color: Colors.grey,
            );
          },

        //prototypeItem: ListTile(
        //  title: Text(items.first),
        //  style: ListTileStyle.list,
        //  shape: Border(
        //    bottom: BorderSide(color: Colors.black, width: 5),
        //  ),
        //),
        itemBuilder: (context, index) {
          return ExpandablePanel(
            header: Text(categories.elementAt(index).name),
            collapsed: Text(categories.elementAt(index).alias),
            expanded:
            Wrap(
              spacing: 5,
              children: [
                EditDialog(objectToEdit: categories.elementAt(index)),
                //TextButton(
                //    style: TextButton.styleFrom(
                //      foregroundColor: Colors.white,
                //      backgroundColor: Colors.black,
                //    ),
                //    onPressed: () {
                //    },
                //    child: Text("Edit")
                //),
                ConfirmDialog(onConfirm: () {

                }),
              ],
            ),

            //title:
            //onTap: () {
//
            //},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CategoryFormState(edit: false)
            ),
          ),
        ),
        backgroundColor: Colors.black,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        //child: EditDialogExample(),
      )
    );
  }
}