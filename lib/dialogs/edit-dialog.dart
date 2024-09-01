import 'package:flutter/material.dart';
import 'package:test_flutthe/forms/expense-form.dart';
import 'package:test_flutthe/models/category.dart';

import '../forms/category-form.dart';
import '../models/expenditure.dart';

class EditDialog extends StatelessWidget {

  final Object objectToEdit;

  const EditDialog({super.key, required this.objectToEdit});

  @override
  Widget build(BuildContext context) {

    StatefulWidget widgetToDisplay;

    if (this.objectToEdit is Category) {
      widgetToDisplay = CategoryFormState(edit: true, category: this.objectToEdit as Category);
    } else {
      widgetToDisplay = ExpenseFormState(edit: true, expenditure: this.objectToEdit as Expenditure);
    }

    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widgetToDisplay,
              ),
            ),
          ),
          child: Text("Edit"),
        ),
      ],
    );
  }
}