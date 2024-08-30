import 'package:flutter/material.dart';
import '../mongo.dart';


class ExpenseState extends StatefulWidget {
  const ExpenseState({super.key});

  @override
  State<ExpenseState> createState() => ExpenseScreen();
}


class ExpenseScreen extends State<ExpenseState> {

  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  final Mongo mongoDatabase = Mongo();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Expenses"),
      ),
      body: Column(
        children: [
          //ElevatedButton(
          //  onPressed: () async {
          //    List<Expenditure> expenditures = await mongoDatabase.fetchExpenditures();
          //  },
          //  child: Text('Next'),
          //),
          TextField(
            controller: amountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
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
                  icon: Icon(Icons.calendar_month_outlined), //icon of text field
                  labelText: "Enter Date" //label text of field
              ),
              readOnly: true,  // when true user cannot edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101)
                );

                if(pickedDate != null ){
                  print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                  //String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                  // print(formattedDate); //formatted date output using intl package =>  2022-07-04
                  //You can format date as per your need

                  //setState(() {
                  //  dateController.text = pickedDate.toString();
                  //});
                  //setState(() {
                  //  dateController.text = formattedDate; //set foratted date to TextField value.
                  //});
                }else{
                  print("Date is not selected");
                }

              }
          ),
          SizedBox(height: 10),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightGreen,
                minimumSize: Size.fromHeight(50),
              ),

              onPressed: () async {
                print(amountController.value);
                print(dateController.value);


                await mongoDatabase.insertData({
                  "amount": int.parse(amountController.text),
                  "date": dateController.text,
                });

                amountController.clear();
                dateController.clear();

              },
              child: Text('Insert')
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  { },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}