import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CustomCheckbox extends StatelessWidget {
  final String content;
  final RxBool isChecked = false.obs;
  CustomCheckbox(
    this.content, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Obx(
        () => CheckboxListTile(
          title: Text(content),
          controlAffinity: ListTileControlAffinity.trailing,
          value: isChecked.value,
          onChanged: (bool? value) {
            isChecked.value = !isChecked.value;
          },
        ),
      ),
    );
  }
}
