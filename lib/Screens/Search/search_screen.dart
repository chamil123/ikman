import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:classic_ads/Controllers/category_controller.dart';
import 'package:classic_ads/Providers/category_provider.dart';
import 'package:classic_ads/Screens/Search/SubCategoryScreen.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import '../../utils/strings.dart';
import 'Widgets/custom_category_shimer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: Text(
          //   'Search',
          //   style: TextStyle(fontSize: 16),
          // ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              width: size.width, // Provide a fixed width constraint
              child: customTextField(
                CupertinoIcons.search,
                "Search....",
                "First Name",
                false,
                false,
                emailController,
                (value) {
                  if (value!.isEmpty) {
                    return ("Please enter first name");
                  }
                  return null;
                },
              ),
            )
          ],
        ),
        body: Consumer<CategoryProvider>(
          builder: (context, value, child) {
            final categories = value.categories;
            if (value.isLoading) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCategoryShimmer(size: size),
                    CustomCategoryShimmer(size: size),
                    CustomCategoryShimmer(size: size),
                  ],
                ),
              );

              //  else if (value.errorMessage.isNotEmpty) {
              //   return Center(child: Text(value.errorMessage));
              // }
            } else {
              return GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      value.fetcSubCategories(category.id);
                      Get.to(
                        () => SubCategoryScreen(
                            categoryName: category.name,
                            categoryIconUrl: category.image),
                        transition: Transition.cupertino,
                        // duration: const Duration(seconds: 1),
                        fullscreenDialog: true,
                        //  key: Get.key, // Provide the Get.key parameter
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 0.3)),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: CachedNetworkImage(
                                imageUrl: baseUrl +
                                    "public/images/Category/" +
                                    category.image,
                                placeholder: (context, url) =>
                                    const SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                      width: double.infinity,
                                      height: 60, // Match the Image height
                                      shape: BoxShape.circle),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              //  Image.network('https://demo.satasmewebdev.online/public/images/Category/'+category.image),
                            ),
                            // Text(category.name),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            //  GridView.count(
            //   crossAxisCount: 3, // Number of columns
            //   padding: EdgeInsets.all(16.0),
            //   mainAxisSpacing: 0, // Set to 0 to remove vertical spacing
            //   crossAxisSpacing: 0, // Set to 0 to remove horizontal spacing
            //   children: List.generate(
            //     15, // Number of items
            //     (index) {
            //       // return Card(

            //       return Container(
            //         color: Colors.teal[100 * ((index % 9) + 1)], // Random color
            //         child: Text(
            //           'Item $index', // Replace with your item data
            //           style: TextStyle(
            //             fontSize: 18.0,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       );
            //       // );
            //     },
            //   ),
            // );
          },
        ));
  }

  Padding customTextField(
    IconData icon,
    String hintText,
    String labelText,
    bool isPassword,
    bool isEmail,
    TextEditingController controller,
    String? Function(String?)? validator,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.0, // Set the height here
            child: TextFormField(
              obscureText: isPassword,
              controller: controller,
              keyboardType:
                  isEmail ? TextInputType.emailAddress : TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 235, 236, 237),
                prefixIcon: Icon(
                  icon,
                  color: Colors.grey,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 220, 218, 218)),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                hintText: hintText,
                // labelText: labelText,
                hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
