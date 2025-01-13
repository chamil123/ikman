import 'package:classic_ads/Providers/ads_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../Components/Custom_dropdown_decoration.dart';
import '../../Widgets/base_form.dart';

class CarsAdForm extends BaseAdForm {
  CarsAdForm({Key? key, required void Function(Map<String, dynamic>) onSave})
      : super(key: key, onSave: onSave);

  @override
  CarsAdFormState createState() => CarsAdFormState();

  @override
  List<Widget> buildCategoryFields(
      Map<String, dynamic> formData, Function(void Function()) setState) {
    formData['specialization'] ??= <String>{};
    formData['condition'] ??= "New";
    formData['price_type'] ??= "1";
    formData['post_type'] ??= "1";

    return [
      buildConditionField(formData, setState),
      const SizedBox(height: 10),
      buildDropdownField(
        'Device Type',
        'Select a type',
        formData,
        setState,
      ),
      const SizedBox(height: 20),
      buildDropdownModelField(
        'Brand Name',
        'Select a Brand',
        formData,
        setState,
      ),
      const SizedBox(height: 15),
      buildDropdownScreenSizeField(
        'Screen Size',
        'Select a Size',
        formData,
        setState,
      ),
      const SizedBox(height: 15),

      // buildDropdownModelField(formData, setState),

      const SizedBox(height: 15),
      buildPriceTypeField(formData, setState),
      const SizedBox(height: 15),
      buildPostTypeField(formData, setState),
      const SizedBox(height: 20),
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
  Widget buildDropdownField(String key, String hint,
      Map<String, dynamic> formData, Function(void Function()) setState) {
    return Consumer<AdsProvider>(
      builder: (context, adsProvider, child) {
        List<DropdownMenuItem<int>> dropdownItems =
            adsProvider.getBrand.map((brand) {
          return DropdownMenuItem<int>(
            value: brand.id,
            child: Text(brand.name),
          );
        }).toList();
        return Stack(
          children: [
            DropdownButtonFormField<int>(
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
                adsProvider.setSelectedBrandId(newValue!);
                adsProvider.fetchModel();
              },
              items: dropdownItems,
            ),
            if (adsProvider.getBrand.isEmpty)
              const Positioned.fill(
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget buildDropdownModelField(String key, String hint,
      Map<String, dynamic> formData, Function(void Function()) setState) {
    return Consumer<AdsProvider>(
      builder: (context, adsProvider, child) {
        List<DropdownMenuItem<int>> dropdownItems =
            adsProvider.getModel.map((model) {
          return DropdownMenuItem<int>(
            value: model.id,
            child: Text(model.name),
          );
        }).toList();
        return Stack(
          children: [
            DropdownButtonFormField<int>(
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
            ),
            if (adsProvider.isLoadingMore)
              const Positioned.fill(
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget buildDropdownScreenSizeField(String key, String hint,
      Map<String, dynamic> formData, Function(void Function()) setState) {
    return Consumer<AdsProvider>(
      builder: (context, adsProvider, child) {
        List<DropdownMenuItem<int>> dropdownItems =
            adsProvider.getModel.map((model) {
          return DropdownMenuItem<int>(
            value: model.id,
            child: Text(model.name),
          );
        }).toList();
        return Stack(
          children: [
            DropdownButtonFormField<int>(
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
            ),
            if (adsProvider.isLoadingMore)
              const Positioned.fill(
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
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
    List<Map<String, dynamic>> priceTypes = [
      {'id': '1', 'name': 'Fixed'},
      {'id': '2', 'name': 'Negotiable'},
      {'id': '3', 'name': 'Daily'},
      {'id': '4', 'name': 'Weekly'},
      {'id': '5', 'name': 'Monthly'},
      {'id': '6', 'name': 'Yearly'}
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

  Widget buildRadioButton(Map<String, dynamic> priceType,
      Map<String, dynamic> formData, Function(void Function()) setState) {
    return RadioListTile<String>(
      title: Text(priceType['name'], style: const TextStyle(fontSize: 12)),
      value: priceType['id'],
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
    List<Map<String, dynamic>> postTypes = [
      {'id': '1', 'name': 'Booking'},
      {'id': '2', 'name': 'Sale'},
      {'id': '3', 'name': 'Rent'},
    ];
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

  Widget buildPostTypeRadioButton(Map<String, dynamic> postType,
      Map<String, dynamic> formData, Function(void Function()) setState) {
    return RadioListTile<String>(
      title: Text(postType['name'], style: const TextStyle(fontSize: 12)),
      value: postType['id'],
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
        childAspectRatio: 1.05,
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
    return Consumer<AdsProvider>(
      builder: (context, value, child) {
        int imgCount = value.getCropImg?.length ?? 0;
        return Column(
          children: [
            DottedBorder(
              dashPattern: const [8, 4],
              strokeWidth: 0.5,
              child: Container(
                color: Colors.grey[100],
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 1,
                  child: GestureDetector(
                    onTap: () async {
                      value.selectImage(ImageSource.gallery);
                    },
                    child: value.getCropImg != null &&
                            value.getCropImg!.length > index
                        ? IconButton(
                            icon: Image.file(
                              value.getCropImg![index],
                              height: 120,
                              fit: BoxFit.fill,
                            ),
                            onPressed: () {},
                            iconSize: 70,
                          )
                        : const Padding(
                            padding: EdgeInsets.all(30),
                            child: Image(
                              image: AssetImage(
                                "assets/images/upload.png",
                              ),
                              fit: BoxFit.fill,
                              height: 70,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            if (index == 0 && imgCount == 0)
              const Text(
                'First image is required',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
          ],
        );
      },
    );
  }
}

class CarsAdFormState extends BaseAdFormState {}
