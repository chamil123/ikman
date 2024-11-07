import 'package:classic_ads/Providers/ads_provider.dart';
import 'package:classic_ads/Providers/category_provider.dart';
import 'package:classic_ads/Screens/Search/category_screen.dart';
import 'package:classic_ads/Screens/Search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../utils/util_functions.dart';

class PostAdsScreen extends StatefulWidget {
  @override
  State<PostAdsScreen> createState() => _PostAdsScreenState();
}

class _PostAdsScreenState extends State<PostAdsScreen> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Post Screen'),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_left),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Hey",
                              style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                color: Colors.blue[800],
                              ),
                              children: [
                                TextSpan(
                                  text: " dsfsd",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  ),
                                )
                              ]),
                        ),
                        Text(
                          "Choose an option below to posting an ad\n",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTapDown: (_) => setState(() => _isHovered = true),
                    onTapUp: (_) => setState(() => _isHovered = false),
                    onTapCancel: () => setState(() => _isHovered = false),
                    child: Container(
                      // width: 200,
                      // height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.6),
                        color:
                            _isHovered ? Colors.grey[100] : Colors.transparent,
                        // borderRadius: BorderRadius.circular(10),s
                      ),
                      child: InkWell(
                        onTap: () async {
                          if (await UtilFuntions.isNetworkAvailable()) {
                            Provider.of<AdsProvider>(context, listen: false)
                                .setIsLocation(true);
                            // ignore: use_build_context_synchronously
                            Provider.of<CategoryProvider>(context,
                                    listen: false)
                                .fetchCategories();
                            Get.toNamed(
                              '/category-screen',
                              preventDuplicates: false,
                              parameters: {'transition': 'cupertino'},
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Ad created successfully'),
                                backgroundColor: Colors.red,
                                // behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select a category',
                                  style: TextStyle(

                                      // fontSize: 18,
                                      ),
                                ),
                                Icon(
                                  CupertinoIcons.chevron_right,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                width: size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text(
                          'Posting Alowance ',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Text("!"),
                      Text(
                        "Posting Rules",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottom: 0,
            ),
          ],
        ),
      ),
    );
  }
}
