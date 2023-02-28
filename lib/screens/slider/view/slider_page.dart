import 'package:demo47/screens/slider/controller/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  SliderController sliderController = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Slider"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: Get.height / 2,
              width: Get.width,
              margin: EdgeInsets.only(left: Get.width / 15),
              child: Obx(
                () => ListView.builder(
                  itemCount: sliderController.list.length,
                  itemBuilder: (context, index) {
                    return Text(
                      "${sliderController.list[index]}",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    );
                  },
                ),
              ),
              // color: Colors.red,
            ),
            Obx(
              () => Slider(
                label: "${sliderController.value.value}",
                value: sliderController.value.value,
                onChanged: (value) {
                  sliderController.value.value = value;
                  sliderController.list.clear();
                  for (int i = 1; i <= value.round(); i++) {
                    List data = [];
                    for (int j = 1; j <= i; j++) {
                      data.add(j);
                    }
                    sliderController.list.add(data);
                  }
                },
                max: 10,
                min: 0,
                divisions: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
