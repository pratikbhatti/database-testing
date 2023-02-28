import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController txtRegEmail = TextEditingController();
  TextEditingController txtRegPassword = TextEditingController();
  TextEditingController txtRegRePassword = TextEditingController();
}
