import 'package:flutter/material.dart';

import '../Widgets/base_form.dart';

class ElectronicAdForm extends BaseAdForm {
  // ElectronicAdForm({required void Function(Map<String, dynamic>) onSave})
  //     : super(onSave: onSave);
ElectronicAdForm({Key? key, required void Function(Map<String, dynamic>) onSave})
      : super(key: key, onSave: onSave);
  @override
  ElectronicAdFormState createState() => ElectronicAdFormState();

  @override
  List<Widget> buildCategoryFields(
      Map<String, dynamic> formData, Function(void Function()) setState) {
    return [
      customTextField(
        "Brand",
        (value) => formData['Brand'] = value,
        (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the Brand';
          }
          return null;
        },
      ),
      customTextField(
        "model",
        (value) => formData['model'] = value,
        (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the model';
          }
          return null;
        },
      ),
      
      // Add other electronic-specific fields
    ];
  }
}

class ElectronicAdFormState extends BaseAdFormState {}
