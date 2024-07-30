import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

abstract class BaseAdForm extends StatefulWidget {
  BaseAdForm({Key? key, required this.onSave}) : super(key: key);
  final void Function(Map<String, dynamic>) onSave;

  @override
  BaseAdFormState createState();

  // Define the abstract method here
  List<Widget> buildCategoryFields(Map<String, dynamic> formData);
}

abstract class BaseAdFormState extends State<BaseAdForm> {
  final formKey = GlobalKey<FormState>();
  final formData = <String, dynamic>{};

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
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                // Your existing form fields...
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Title'),
                //   onSaved: (value) => formData['title'] = value,
                // ),
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
                  (value) => formData['Price'] = value,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Price';
                    }
                    return null;
                  },
                ),
                 customTextField(
                  "Description",
                  (value) => formData['Description'] = value,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Description';
                    }
                    return null;
                  },
                ),
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Description'),
                //   onSaved: (value) => formData['description'] = value,
                // ),
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Price'),
                //   onSaved: (value) => formData['price'] = value,
                // ),
                ...widget.buildCategoryFields(formData),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      widget.onSave(formData);
                    }
                  },
                  child: Text('Submit Ad'),
                ),
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
  // String labelText,
  // bool isPassword,
  // bool isEmail,
  // TextEditingController controller,

  // final InputDecoration decoration,
  final Function(String?) onSaved,
  String? Function(String?)? validator,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextFormField(
        //   decoration: decoration,
        //   onSaved: onSaved,
        //   validator: validator,
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Text"),
            TextFormField(
              // obscureText: false,
              // decoration: decoration,
              // controller: controller,
              // keyboardType:
              //     isEmail ? TextInputType.emailAddress : TextInputType.text,
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
                // hintText: hintText,
                labelText: hintText,
                hintStyle:
                    const TextStyle(fontSize: 14, color: Constants.textColor1),
                labelStyle: const TextStyle(color: Constants.labelText)
              ),
              validator: validator,
              onSaved: onSaved,
            ),
          ],
        ),
      ],
    ),
  );
}
