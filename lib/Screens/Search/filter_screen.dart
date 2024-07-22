import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:classic_ads/Providers/category_provider.dart';
import 'package:classic_ads/Screens/Components/custom_dialog.dart';
import 'package:classic_ads/Screens/Home/main_screen.dart';
import 'package:classic_ads/Screens/Search/SubCategoryScreen.dart';
import 'package:classic_ads/Screens/Search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import '../../Providers/ads_provider.dart';

class FilterScreen extends StatefulWidget {
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final adsProvider = context.read<AdsProvider>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Filter Screen',
          style: TextStyle(fontSize: 14),
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_left),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        // actions: [
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
        // ],
      ),
      body: SizedBox(
        width: size.width,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                // SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Provider.of<CategoryProvider>(context, listen: false)
                    //     .fetchCategories();
                    Get.toNamed(
                      '/location-screen',
                      preventDuplicates: false,
                      parameters: {'transition': 'cupertino'},
                    );
                  },
                  child: Container(
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          color: Colors.green,
                        ),
                        SizedBox(width: 10),
                        adsProvider.getdistric != null
                            ? Text(adsProvider.getdistric!.nameEn)
                            : Text('All Country'),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<CategoryProvider>(context, listen: false)
                        .fetchCategories();
                    Provider.of<AdsProvider>(context, listen: false)
                        .setIsLocation();

                    Get.toNamed(
                      '/category-screen',
                      preventDuplicates: false,
                      parameters: {'transition': 'cupertino'},
                    );
                  },
                  child: Container(
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        Icon(
                          CupertinoIcons.square_grid_2x2_fill,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10),
                        adsProvider.getSubCategory != null
                            ? Text(adsProvider.getSubCategory!.name)
                            : Text('All Category'),
                      ]),
                    ),
                  ),
                ),
                //
              ],
            ),
          ),
          Positioned(
            bottom: -5,
            child: SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white),
                      child: const Text('Cancel'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(
                          '/',
                          parameters: {'transition': 'cupertino'},
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          backgroundColor: HexColor("#00c853"),
                          foregroundColor: Colors.white),
                      child: const Text('Apply'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
