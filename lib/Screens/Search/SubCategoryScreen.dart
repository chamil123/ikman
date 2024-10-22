import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:classic_ads/Screens/Components/custom_dialog.dart';
import 'package:classic_ads/Screens/Home/main_screen.dart';
import 'package:classic_ads/Screens/Post/AdComponants/location_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:classic_ads/Providers/category_provider.dart';
import 'package:classic_ads/utils/strings.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletons/skeletons.dart';

import '../../Providers/ads_provider.dart';
import 'Widgets/custom_sub_category_shimmer.dart';

class SubCategoryScreen extends StatelessWidget {
  final String categoryName;
  final String categoryIconUrl;

  SubCategoryScreen(
      {super.key, this.categoryName = "", this.categoryIconUrl = ""});

  @override
  Widget build(BuildContext context) {
    final adsProvider = context.read<AdsProvider>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.chevron_left),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        leading: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: CachedNetworkImage(
                  imageUrl:
                      baseUrl + "/public/images/Category/" + categoryIconUrl,
                  placeholder: (context, url) => const SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: 60, // Match the Image height
                        shape: BoxShape.circle),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            // const SizedBox(width: 20.0),
            // const Text('datadddddddddddddddddddddddddddddddddd'),
          ],
        ),
        title: Text(
          categoryName,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {
              DialogBox().dialogBox(
                  context,
                  DialogType.noHeader,
                  'Exit form?',
                  'Are you sure want to exit from this form?\n if you do, all you entered data will be lost.',
                  false, () {
                Get.offAll(
                  () => const HomeScreen(),
                  transition: Transition.cupertino,
                  fullscreenDialog: true,
                );
              }, () {});
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            // Container(
            //   height: 100,
            //   color: Colors.amber,
            // ),
            Expanded(child: Consumer<CategoryProvider>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return const Column(
                    children: [
                      CustomSubCategoryShimmer(),
                      CustomSubCategoryShimmer(),
                      CustomSubCategoryShimmer(),
                      CustomSubCategoryShimmer(),
                      CustomSubCategoryShimmer(),
                      CustomSubCategoryShimmer(),
                    ],
                  );
                } else {
                  final subCategories = value.subCategories;
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: subCategories.length,
                      itemBuilder: (context, index) {
                        // var isLast=index= items.length - 1;
                        return InkWell(
                          onTap: () {
                            // Provider.of<AdsProvider>(context, listen: false)
                            adsProvider
                                .selectedSubCategory(subCategories[index]);

                            if (adsProvider.isLocation) {
                              Get.to(
                                () => LocationScreen(),
                                transition: Transition.cupertino,
                                fullscreenDialog: true,
                              );
                            } else {
                              // adsProvider.fetchPosts();
                              // Get.offAllNamed(
                              //   '/',

                              //   parameters: {'transition': 'cupertino'},

                              // );
                              Get.toNamed(
                                '/filter-screen',
                                preventDuplicates: false,
                                parameters: {'transition': 'cupertino'},
                              );
                            }
                          },
                          child: SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 2),
                                    child: Row(
                                      children: [
                                        // const Icon(Icons.category),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 193, 230, 247),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.05),
                                                  blurRadius: 15,
                                                  spreadRadius: 1),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(
                                              CupertinoIcons
                                                  .checkmark_alt_circle_fill,
                                              color: Colors.lightBlue,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          subCategories[index].name.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // ListTile(
                                //   contentPadding: const EdgeInsets.symmetric(
                                //       horizontal: 16.0, vertical: 8.0), // Add padding
                                //   leading: const Icon(Icons.category),
                                //   title: Text(
                                //     items[index],
                                //     style: const TextStyle(fontWeight: FontWeight.bold),
                                //   ),
                                //   trailing: const Icon(Icons.chevron_right),
                                // ),
                                if (index != subCategories.length - 1)
                                  const Divider(thickness: 0.5),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
