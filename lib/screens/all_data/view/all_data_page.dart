import 'package:demo47/screens/add_data/controller/add_data_controller.dart';
import 'package:demo47/screens/add_data/view/add_data_page.dart';
import 'package:demo47/screens/add_data/view/update_page.dart';
import 'package:demo47/screens/login/view/login_page.dart';
import 'package:demo47/utility/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class AllDataPage extends StatefulWidget {
  const AllDataPage({super.key});

  @override
  State<AllDataPage> createState() => _AllDataPageState();
}

class _AllDataPageState extends State<AllDataPage> {
  AddDataController addDataController = Get.put(AddDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    addDataController.data.value = await DbHelper.dbHelper.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("All Data"),
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text("Log Out"),
            )
          ],
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: addDataController.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${addDataController.data[index]['category']}"),
                subtitle: Text("${addDataController.data[index]['name']}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        addDataController.nametxt.text =
                            addDataController.data[index]['name'];
                        addDataController.nametxt.text =
                            addDataController.data[index]['name'];
                        addDataController.categorytxt.text =
                            addDataController.data[index]['category'];
                        getData();
                        Get.to(UpdatePage());
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        DbHelper.dbHelper.deleteData(
                            id: addDataController.data[index]['id']);
                        getData();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddDataPage());
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
