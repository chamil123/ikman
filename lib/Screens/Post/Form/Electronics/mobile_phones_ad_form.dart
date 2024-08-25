import 'dart:io';

import 'package:classic_ads/Providers/ads_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../Model/brand.dart';
import '../../../../Model/model.dart';
import '../../Widgets/base_form.dart';

class MobilePhoneAdForm extends BaseAdForm {
  MobilePhoneAdForm(
      {Key? key, required void Function(Map<String, dynamic>) onSave})
      : super(key: key, onSave: onSave);

  @override
  MobilePhoneAdFormState createState() => MobilePhoneAdFormState();

  @override
  List<Widget> buildCategoryFields(
      Map<String, dynamic> formData, Function(void Function()) setState) {
    formData['specialization'] ??= <String>{};
    formData['condition'] ??= "New";
    formData['price_type'] ??= "Fixed";
    formData['post_type'] ??= "Sale";

    return [
      buildConditionField(formData, setState),
      const SizedBox(height: 10),
      buildDropdownField(
        'brand',
        'Select Brand',
        formData,
        setState,
      ),
      const SizedBox(height: 20),
      buildDropdownModelField(
          'model',
          'Select a model',
          formData,
          setState,
          ),
      const SizedBox(height: 15),
      buildSpecializationField(formData, setState),
      buildPriceTypeField(formData, setState),
      buildPostTypeField(formData, setState),
      const SizedBox(height: 10),
      buildImageSelectors(formData, setState),
      const SizedBox(height: 50),
    ];
  }

  Widget buildConditionField(
      Map<String, dynamic> formData, Function(void Function()) setState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Condition"),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text("New"),
                value: "New",
                groupValue: formData['condition'],
                onChanged: (value) {
                  setState(() {
                    formData['condition'] = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text("Used"),
                value: "Used",
                groupValue: formData['condition'],
                onChanged: (value) {
                  setState(() {
                    formData['condition'] = value;
                  });
                },
              ),
            ),
          ],
        ),
        if (formData['condition'] == null)
          const Text(
            'Please select a condition',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }

// buildDropdownModelField
  Widget buildDropdownField(String key, String hint, Map<String, dynamic> formData, Function(void Function()) setState) {
    return Consumer<AdsProvider>(
      builder: (context, adsProvider, child) {
        if (adsProvider.getBrand.isEmpty) {
          // Fetch brands if they haven't been loaded yet
          adsProvider.fetchBrands();
          return CircularProgressIndicator(); // Show loading indicator while fetching
        }
        List<DropdownMenuItem<int>> dropdownItems =  adsProvider.getBrand.map((brand) {
                return DropdownMenuItem<int>(
                  value: brand.id,
                  child: Text(brand.name),
                );
              }).toList() ;

        return DropdownButtonFormField<int>(
          decoration: dropDownDecoration(),
          value: formData[key],
          hint: Text(hint),
          validator: (value) {
            if (value == null) {
              return 'Please select a $key';
            }
            return null;
          },
          onChanged: (int? newValue) {
            setState(() {
              formData[key] = newValue;
            });
          },
          items: dropdownItems,
        );
      },
    );
  }
  Widget buildDropdownModelField(String key, String hint, Map<String, dynamic> formData, Function(void Function()) setState) {
    return Consumer<AdsProvider>(
      builder: (context, adsProvider, child) {
        if (adsProvider.getModel.isEmpty) {
          // Fetch brands if they haven't been loaded yet
          adsProvider.fetchModel();
          return CircularProgressIndicator(); // Show loading indicator while fetching
        }
        List<DropdownMenuItem<int>> dropdownItems =  adsProvider.getModel.map((model) {
                return DropdownMenuItem<int>(
                  value: model.id,
                  child: Text(model.name),
                );
              }).toList() ;
        return DropdownButtonFormField<int>(
          decoration: dropDownDecoration(),
          value: formData[key],
          hint: Text(hint),
          validator: (value) {
            if (value == null) {
              return 'Please select a $key';
            }
            return null;
          },
          onChanged: (int? newValue) {
            setState(() {
              formData[key] = newValue!;
            });
          },
          items: dropdownItems,
        );
      },
    );
  }
  Widget buildSpecializationField(
      Map<String, dynamic> formData, Function(void Function()) setState) {
    List<String> features = [
      '4G',
      '5G',
      'Dual SIM',
      'Micro SIM',
      'Mini SIM',
      'USB Type-C',
      'Fast Charging',
      'Flash',
      'Android',
      'iOS',
      'Expandable Storage',
      'Bluetooth',
      'WiFi',
      'GPS',
      'Fingerprint',
      'Infrared'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Specialization"),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 0,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            return buildCheckbox(features[index], formData, setState);
          },
        ),
      ],
    );
  }

  Widget buildCheckbox(String feature, Map<String, dynamic> formData,
      Function(void Function()) setState) {
    return CheckboxListTile(
      title: Text(feature, style: const TextStyle(fontSize: 12)),
      value: formData['specialization']?.contains(feature) ?? false,
      onChanged: (bool? value) {
        setState(() {
          formData['specialization'] ??= <String>{};
          if (value == true) {
            (formData['specialization'] as Set<String>).add(feature);
          } else {
            (formData['specialization'] as Set<String>).remove(feature);
          }
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
    );
  }

  Widget buildPriceTypeField(
      Map<String, dynamic> formData, Function(void Function()) setState) {
    List<String> priceTypes = [
      'Fixed',
      'Negotiable',
      'Daily',
      'Weekly',
      'Monthly',
      'Yearly'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Price Type"),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 0,
          ),
          itemCount: priceTypes.length,
          itemBuilder: (context, index) {
            return buildRadioButton(priceTypes[index], formData, setState);
          },
        ),
        if (formData['price_type'] == null)
          const Text(
            'Please select a price type',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }

  Widget buildRadioButton(String value, Map<String, dynamic> formData,
      Function(void Function()) setState) {
    return RadioListTile<String>(
      title: Text(value, style: const TextStyle(fontSize: 12)),
      value: value,
      groupValue: formData['price_type'],
      onChanged: (String? newValue) {
        setState(() {
          formData['price_type'] = newValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
    );
  }

  Widget buildPostTypeField(
      Map<String, dynamic> formData, Function(void Function()) setState) {
    List<String> postTypes = ['Booking', 'Sale', 'Rent'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Post Type"),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 0,
          ),
          itemCount: postTypes.length,
          itemBuilder: (context, index) {
            return buildPostTypeRadioButton(
                postTypes[index], formData, setState);
          },
        ),
        if (formData['post_type'] == null)
          const Text(
            'Please select a post type',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }

  Widget buildPostTypeRadioButton(String value, Map<String, dynamic> formData,
      Function(void Function()) setState) {
    return RadioListTile<String>(
      title: Text(value, style: const TextStyle(fontSize: 12)),
      value: value,
      groupValue: formData['post_type'],
      onChanged: (String? newValue) {
        setState(() {
          formData['post_type'] = newValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }

  Widget buildImageSelectors(
      Map<String, dynamic> formData, Function(void Function()) setState) {
    formData['images'] ??= List.filled(5, null);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 5,
      ),
      itemCount: 5,
      itemBuilder: (context, index) =>
          buildImageSelector(index, formData, setState),
    );
  }

  Widget buildImageSelector(int index, Map<String, dynamic> formData,
      Function(void Function()) setState) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            final ImagePicker _picker = ImagePicker();
            final XFile? image =
                await _picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              setState(() {
                formData['images'][index] = image;
              });
            }
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: formData['images'][index] == null
                ? const Icon(Icons.add_a_photo, size: 40)
                : Image.file(File(formData['images'][index].path),
                    fit: BoxFit.cover),
          ),
        ),
        if (index == 0 && formData['images'][0] == null)
          const Text(
            'First image is required',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }

  InputDecoration dropDownDecoration() {
    return const InputDecoration(
      filled: true,
      fillColor: Color.fromARGB(255, 243, 245, 247),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      contentPadding: EdgeInsets.all(10),
    );
  }
}

class MobilePhoneAdFormState extends BaseAdFormState {}
