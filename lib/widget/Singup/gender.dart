
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/ControllerSingup.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    ControllerSingup controller = Get.find();
    return Container(
      width: 400,
      height: 60,child:  Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: controller.genderItems
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: controller.selectedValue
          ,
          onChanged: (String? value) {
            setState(() {
              controller.selectedValue = value!;
            });
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    ),
      // child: CustomDropdownButton2(
      //   buttonDecoration: BoxDecoration(
      //       color: Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1),
      //       borderRadius: BorderRadius.all(Radius.circular(15))),
      //   hint: 'Select Item',
      //   dropdownItems: controller.genderItems,
      //   value: controller.selectedValue,
      //   onChanged: (value) {
      //     setState(() {
      //       controller.selectedValue = value.toString();
      //     });
      //   },
      // ),
    );
  }}