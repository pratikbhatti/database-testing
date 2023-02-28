import 'package:demo47/screens/add_data/controller/add_data_controller.dart';
import 'package:demo47/screens/all_data/view/all_data_page.dart';
import 'package:demo47/utility/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  AddDataController addDataController = Get.put(AddDataController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Data"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: addDataController.nametxt,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'name',
                  hintText: 'Enter The Task Name',
                  prefixIcon: Icon(
                    Icons.task_alt,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: addDataController.categorytxt,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'category',
                  hintText: 'Enter The Task Category',
                  prefixIcon: Icon(
                    Icons.category,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (addDataController.nametxt.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Please Enter Task Name",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  } else if (addDataController.categorytxt.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Please Enter Category ",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  } else {
                    DbHelper.dbHelper.insertData(
                      name: addDataController.nametxt.text,
                      category: addDataController.categorytxt.text,
                    );
                    // DbHelper.dbHelper.updateData(id:addDataController.data[index]['id'] , name: addDataController.nametxt.text, category: addDataController.categorytxt.text)
                    Get.to(
                      AllDataPage(),
                    );
                  }
                },
                child: Text("update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
