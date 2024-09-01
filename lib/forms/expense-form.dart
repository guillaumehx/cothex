import 'package:flutter/material.dart';

import '../models/expenditure.dart';

class ExpenseFormState extends StatefulWidget {

  final bool edit;
  final Expenditure? expenditure;

  const ExpenseFormState({super.key, required this.edit, this.expenditure});

  @override
  State<ExpenseFormState> createState() => ExpenseFormScreen(edit: edit, expenditure: expenditure);
}

class ExpenseFormScreen extends State<ExpenseFormState> {

  bool edit;
  Expenditure? expenditure;

  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  ExpenseFormScreen({required this.edit, this.expenditure});


  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {

    this.amountController.text = expenditure?.amount.toString() ?? "";
    this.dateController.text = expenditure?.date.toString() ?? "";

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: amountController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                borderSide: BorderSide(
                    width: 10.0
                )
            ),
            icon: Icon(Icons.euro, color: Colors.black),
            hintText: 'Amount',
          ),
        ),
        SizedBox(height: 10),
        TextField(
            controller: dateController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                icon: Icon(Icons.calendar_month_outlined, color: Colors.black),
                labelText: "Date"
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate:DateTime(2000),
                  lastDate: DateTime(2101)
              );

              if (pickedDate != null) {
                setState(() {
                  dateController.text = pickedDate.toString();
                });
              }
            }
        ),
        // TODO

        DropdownButton(
          isExpanded: true,
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          menuWidth: 1000,
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        ),
        // TODO dropdown list
        SizedBox(height: 10),
        TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                minimumSize: Size.fromHeight(50),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10)
            ),

            onPressed: () async {
              print(amountController.value);
              print(dateController.value);


              //await mongoDatabase.insertData({
              //  "amount": int.parse(amountController.text),
              //  "date": dateController.text,
              //});

              amountController.clear();
              dateController.clear();
              FocusScope.of(context).unfocus();

            },
            child: Text(this.edit ? "Update" : "Add")
        )
      ],
    );
  }
}