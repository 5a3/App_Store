import 'package:flutter/material.dart';

class customtextfiled extends StatelessWidget {
  customtextfiled(
      {super.key,
      required this.controller,
      this.image,
      required this.title,
      this.descrption,
      this.price});
  String? title;
  String? price;
  String? image;
  Icons? icon;
  String? descrption;
  TextEditingController? controller;
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'ادخل ${title}',
            )));
  }
}
