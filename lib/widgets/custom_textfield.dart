import 'package:flutter/material.dart';

customTextField(
    {required String lable, required String hint, required int maxline,required TextEditingController contrl}) {
  return TextField(
    controller:contrl ,
    maxLines: maxline,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(lable),
        hintText: hint
        ),
  );
}
