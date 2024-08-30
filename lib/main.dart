import 'package:flutter/material.dart';
import 'package:test_flutthe/expenditure.dart';
import 'package:test_flutthe/screens/expense-screen.dart';
import 'package:test_flutthe/user-page.dart';
import 'mongo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Cothex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  final Mongo mongoDatabase = Mongo();

  @override
  void initState() {
    dateController.text = "";
    super.initState();
    mongoDatabase.connect();
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text("Expenses"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpenseState()),
                  );
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text("Categories"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPage()),
                  );
                },
              ),
            ],
          ),
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

                  setState(() {
                    dateController.text = pickedDate.toString();
                  });
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
