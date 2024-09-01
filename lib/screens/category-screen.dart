import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CategoryState extends StatefulWidget {

  const CategoryState({super.key});

  @override
  State<CategoryState> createState() => CategoryScreen();
}

class CategoryScreen extends State<CategoryState> {

  final List<String> items = List<String>.generate(100, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Categories"),
      ),
      body: ListView.separated(
        itemCount: items.length,
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
            header: Text(items[index]),
            collapsed: Text(""),
            expanded:
            Wrap(
              spacing: 5,
              children: [
                EditDialogExample(),
                //TextButton(
                //    style: TextButton.styleFrom(
                //      foregroundColor: Colors.white,
                //      backgroundColor: Colors.black,
                //    ),
                //    onPressed: () {
                //    },
                //    child: Text("Edit")
                //),
                DialogExample(),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //ElevatedButton(
                  //  onPressed: () async {
                  //    List<Expenditure> expenditures = await mongoDatabase.fetchExpenditures();
                  //  },
                  //  child: Text('Next'),
                  //),
                  TextField(
                    //controller: amountController,
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
                    //controller: dateController,
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
                          //setState(() {
                          //  dateController.text = pickedDate.toString();
                          //});
                        }
                      }
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          minimumSize: Size.fromHeight(50),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10)
                      ),

                      onPressed: () async {
                        //print(amountController.value);
                        //print(dateController.value);
//
//
                        //await mongoDatabase.insertData({
                        //  "amount": int.parse(amountController.text),
                        //  "date": dateController.text,
                        //});
//
                        //amountController.clear();
                        //dateController.clear();
                        FocusScope.of(context).unfocus();

                      },
                      child: Text("Update")
                  )
                ],
              ),
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

class EditDialogExample extends StatelessWidget {
  const EditDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //ElevatedButton(
                    //  onPressed: () async {
                    //    List<Expenditure> expenditures = await mongoDatabase.fetchExpenditures();
                    //  },
                    //  child: Text('Next'),
                    //),
                    TextField(
                      //controller: amountController,
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
                        //controller: dateController,
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
                           //setState(() {
                           //  dateController.text = pickedDate.toString();
                           //});
                          }
                        }
                    ),
                    SizedBox(height: 10),
                    TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            minimumSize: Size.fromHeight(50),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10)
                        ),

                        onPressed: () async {
                          //print(amountController.value);
                          //print(dateController.value);
//
//
                          //await mongoDatabase.insertData({
                          //  "amount": int.parse(amountController.text),
                          //  "date": dateController.text,
                          //});
//
                          //amountController.clear();
                          //dateController.clear();
                          FocusScope.of(context).unfocus();

                        },
                        child: Text("Update")
                    )
                  ],
                ),
              ),
            ),
          ),
          child: Text("Edit"),
        ),
      ],
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const Text('Confirm deletion of category ?'),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // TODO delete
                      },
                      child: const Text("Yes"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("No"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: const Text("Delete"),
        ),
      ],
    );
  }
}