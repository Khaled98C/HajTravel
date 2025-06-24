
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/ControllerSingup.dart';

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
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
          items: controller.countryItems
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
          value: controller.selectcountry
          ,
          onChanged: (String? value) {
            setState(() {
              controller.selectcountry = value!;
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