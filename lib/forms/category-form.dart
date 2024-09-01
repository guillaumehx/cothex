import 'package:flutter/material.dart';
import 'package:test_flutthe/models/category.dart';

class CategoryFormState extends StatefulWidget {

  final bool edit;
  final Category? category;

  const CategoryFormState({super.key, required this.edit, this.category});

  @override
  State<CategoryFormState> createState() => CategoryFormScreen(edit: edit, category: category);
}

class CategoryFormScreen extends State<CategoryFormState> {

  bool edit;
  Category? category;

  TextEditingController nameController = TextEditingController();
  TextEditingController aliasController = TextEditingController();

  CategoryFormScreen({required this.edit, this.category});

  @override
  Widget build(BuildContext context) {

    print("blazbla");
    print(category);
    this.nameController.text = category?.name ?? "";
    this.aliasController.text = category?.alias ?? "";

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            "ID : " + (category?.id.oid ?? "").toString()
        ),
        SizedBox(height: 10),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                borderSide: BorderSide(
                    width: 10.0
                )
            ),
            icon: Icon(Icons.category),
            hintText: "Name",
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: aliasController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                borderSide: BorderSide(
                    width: 10.0
                )
            ),
            icon: Icon(Icons.edit_note_outlined),
            hintText: "Alias",
          ),
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
            child: Text(edit ? "Update" : "Add")
        )
      ],
    );
  }
}