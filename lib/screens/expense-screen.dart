import 'package:flutter/material.dart';
import '../mongo.dart';

class ExpenseState extends StatefulWidget {

  const ExpenseState({super.key});

  @override
  State<ExpenseState> createState() => ExpenseScreen();
}

class ExpenseScreen extends State<ExpenseState> {

  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final Mongo mongoDatabase = Mongo();

  @override
  void initState() {
    amountController.text = "";
    dateController.text = "";
    mongoDatabase.connect();
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    dateController.dispose();
    mongoDatabase.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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


                await mongoDatabase.insertData({
                  "amount": int.parse(amountController.text),
                  "date": dateController.text,
                });

                amountController.clear();
                dateController.clear();
                FocusScope.of(context).unfocus();

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