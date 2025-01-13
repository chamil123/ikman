import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:classic_ads/Controllers/location_controller.dart';
import 'package:classic_ads/Model/District%20.dart';
import 'package:classic_ads/Providers/ads_provider.dart';
import 'package:classic_ads/Providers/location_provider.dart';
import 'package:classic_ads/Screens/Components/custom_dialog.dart';
import 'package:classic_ads/Screens/Home/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Form/vehicle_ad_form.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).loadDistricts();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Location',
          style: TextStyle(fontSize: 14),
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_left),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              DialogBox().dialogBox(
                  context,
                  DialogType.noHeader,
                  'Exit form?',
                  'Are you sure want to exit from this form?\n if you do, all you entered data will be lost.',
                  true,
                  () {}, () {
                Get.offAll(
                  () => const HomeScreen(),
                  transition: Transition.cupertino,
                  fullscreenDialog: true,
                );
              });
              //   IconButton(
              //     onPressed: () {
              //       DialogBox().dialogBox(context, DialogType.noHeader, 'Exit form?',
              //           'Are you sure want to exit from this form?\n if you do, all you entered data will be lost.',
              //           () {
              //         Get.offAll(
              //           () => const HomeScreen(),
              //           transition: Transition.cupertino,
              //           fullscreenDialog: true,
              //         );
              //       }, () {});
              //     },
              //     icon: const Icon(Icons.close),
              //   ),
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      // body:
      // ExpandableList(items: _items),
      //  body: _buildBody(),
      body: LocationList(),
    );
  }
}

class LocationList extends StatefulWidget {
  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  String _selectedCategory = 'Vehicle';
  @override
  Widget build(BuildContext context) {
    return Consumer2<LocationProvider, AdsProvider>(
      builder: (context, locationProvider, adsProvider, child) {
        if (locationProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (locationProvider.getDistrics.isEmpty) {
          return Center(child: Text('No districts found'));
        } else {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: locationProvider.getDistrics.length,
            itemBuilder: (context, index) {
              District district = locationProvider.getDistrics[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.3,
                    ),
                  ),
                ),
                child: SizedBox(
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(
                        horizontal: 16.0), // Adjust horizontal padding
                    childrenPadding: EdgeInsets.only(left: 16.0),
                    title: Text(district.nameEn),
                    children: district.cities.map((city) {
                      return ListTile(
                        dense: true, // Makes the ListTile more compact
                        visualDensity: VisualDensity(vertical: -4),
                        title: Text(city.nameEn),
                        // subtitle: Text(city.postcode),
                        onTap: () {
                          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                          adsProvider.fetchBrands();
                          adsProvider.selectedDistrict(district, city);
                          if (adsProvider.isLocation) {
                            setState(() {
                              _selectedCategory =
                                  adsProvider.getSelectedCaegory!.name!;
                            });
                            Get.toNamed(
                              '/ad-screen',
                              preventDuplicates: false,
                              parameters: {'transition': 'cupertino'},
                            );
                          } else {
                            Get.toNamed(
                              '/filter-screen',
                              preventDuplicates: false,
                              parameters: {'transition': 'cupertino'},
                            );
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
