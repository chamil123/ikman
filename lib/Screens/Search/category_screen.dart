import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:classic_ads/Providers/ads_provider.dart';
import 'package:classic_ads/Providers/category_provider.dart';
import 'package:classic_ads/Screens/Components/custom_dialog.dart';
import 'package:classic_ads/Screens/Home/main_screen.dart';
import 'package:classic_ads/Screens/Search/SubCategoryScreen.dart';
import 'package:classic_ads/Screens/Search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import '../../utils/strings.dart';
import 'Widgets/custom_sub_category_shimmer.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Category Screen'),
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
              DialogBox().dialogBox(context, DialogType.noHeader, 'Exit form?',
                  'Are you sure want to exit from this form?\n if you do, all you entered data will be lost.',
                  false,() {
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
                  final categories = value.categories;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      // var isLast=index= items.length - 1;
                      return InkWell(
                        onTap: () {

                          Provider.of<AdsProvider>(context, listen: false).selectedCategory(categories[index]);
                          value.fetcSubCategories(categories[index].id);

                             Get.toNamed(
                              '/sub-category-screen',
                              arguments: {'categoryName': categories[index].name,'categoryIconUrl': categories[index].image},
                              preventDuplicates: false,
                              parameters: {'transition': 'cupertino'},
                              // transition: Transition.cupertino,
                              // fullscreenDialog: true,
                            );

                          // Get.to(
                          //   () => SubCategoryScreen(
                          //       categoryName: categories[index].name,
                          //       categoryIconUrl: categories[index].image),
                          //   transition: Transition.cupertino,
                          //   // duration: const Duration(seconds: 1),
                          //   fullscreenDialog: true,
                          //   //  key: Get.key, // Provide the Get.key parameter
                          // );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 3),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        child: CachedNetworkImage(
                                          imageUrl: baseUrl +
                                              "public/images/Category/" +
                                              categories[index].image,
                                          placeholder: (context, url) =>
                                              const SkeletonAvatar(
                                            style: SkeletonAvatarStyle(
                                              width: double.infinity,
                                              height:
                                                  35, // Match the Image height
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      categories[index].name.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (index != categories.length - 1)
                              const Divider(thickness: 0.5),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
