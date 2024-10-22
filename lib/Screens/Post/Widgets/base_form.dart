import 'package:flutter/material.dart';
import '../../../utils/constant.dart';

abstract class BaseAdForm extends StatefulWidget {
  BaseAdForm({Key? key, required this.onSave}) : super(key: key);
  final void Function(Map<String, dynamic>) onSave;

  @override
  BaseAdFormState createState();

  List<Widget> buildCategoryFields(Map<String, dynamic> formData, Function(void Function()) setState);
}

abstract class BaseAdFormState extends State<BaseAdForm> {
  final formKey = GlobalKey<FormState>();
  final formData = <String, dynamic>{};

  bool validateAndSave() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      widget.onSave(formData);
      return true;
    }
    return false;
  }
 void resetForm() {
    formKey.currentState?.reset();
    setState(() {
      formData.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                customTextField(
                  "Title",
                  (value) => formData['title'] = value,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Title';
                    }
                    return null;
                  },
                ),
                customTextField(
                  "Price",
                  (value) => formData['price'] =double.parse(value!??'0'),
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Price';
                    }
                    return null;
                  },
                ),
                customTextField(
                  "Description",
                  (value) => formData['description'] = value,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Description';
                    }
                    return null;
                  },
                  true
                ),
                ...widget.buildCategoryFields(formData, setState),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding customTextField(
  String hintText,
  final Function(String?) onSaved,
  String? Function(String?)? validator,[bool isMinLine=false]
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 243, 245, 247),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            contentPadding: const EdgeInsets.all(10),
            labelText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Constants.textColor1),
            labelStyle: const TextStyle(color: Constants.labelText)
          ),
          validator: validator,
          onSaved: onSaved,
           maxLines: null, // Allow multiple lines
          minLines:isMinLine? 2:1, // Set a minimum number of lines
          keyboardType: TextInputType.multiline, // Enable multiline input
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}