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
            icon: Icon(Icons.euro),
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
                icon: Icon(Icons.calendar_month_outlined),
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
        SizedBox(height: 10),
        TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
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
            child: Text('Insert')
        )
      ],
    );
  }
}