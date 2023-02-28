import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDataController extends GetxController {
  TextEditingController nametxt = TextEditingController();
  TextEditingController categorytxt = TextEditingController();
  RxList<Map> data = <Map>[].obs;
}
