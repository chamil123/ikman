import 'package:carousel_slider/carousel_slider.dart';
import 'package:classic_ads/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:classic_ads/Providers/ads_provider.dart';
import 'package:classic_ads/Screens/Components/curved_bottom_shape.dart';
import 'package:classic_ads/Screens/Home/main_screen.dart';
import 'package:classic_ads/Screens/Post/view_post_details.dart';
import 'package:classic_ads/utils/constant.dart';
import 'package:provider/provider.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletons/skeletons.dart';
import '../../utils/util_functions.dart';
import '../Components/custom_testfiled.dart';
// import 'Widget/custom_ads_card_shrimmer.dart';
import 'package:shimmer/shimmer.dart';

import 'Widget/custom_ads_card_shrimmer.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final ScrollController _scrollController = ScrollController();
  // final _postController = AdsProvider();
  bool _isShowingBottomBar = true;
  int adLayout = 2;

  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMorePosts);
    final _postController = Provider.of<AdsProvider>(context, listen: false);
    _postController.fetchPosts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMorePosts() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final _postController = Provider.of<AdsProvider>(context, listen: false);
      if (!_postController.isLoadingMore) {
        _postController.fetchPosts();
      }
    }
  }

  final List<Widget> items = [
    // Add your carousel items here
    Container(
      height: 400,
      width: double.infinity,
      color: Colors.red,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/fitted.jpg', // Replace with your image path
              fit: BoxFit.fitWidth,
            ),
          ),
          CarousalBottomBlackLine(),
        ],
      ),
    ),
    Container(
      height: 400,
      width: double.infinity,
      color: Colors.green,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/fitted (2).jpg', // Replace with your image path
              fit: BoxFit.fitWidth,
            ),
          ),
          CarousalBottomBlackLine(),
        ],
      ),
    ),
    Container(
      height: 400,
      width: double.infinity,
      color: Colors.blue,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/fitted (3).jpg', // Replace with your image path
              fit: BoxFit.fitWidth,
            ),
          ),
          CarousalBottomBlackLine(),
        ],
      ),
    ),
    Container(
      height: 400,
      width: double.infinity,
      color: Colors.blue,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/fitted (1).jpg', // Replace with your image path
              fit: BoxFit.fitWidth,
            ),
          ),
          CarousalBottomBlackLine(),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print('getPosts length: ${_postController.getPosts.length}');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
          icon: Icon(Icons.sort_sharp),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
        // shape: RoundedBottomAppBarShape(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(43.0), // Adjust the height as needed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                Expanded(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 14.0, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        '/filter-screen',
                        preventDuplicates: false,
                        parameters: {'transition': 'cupertino'},
                      );
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Constants.themeColor,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                            offset: Offset(0.0, 4.0),
                          ),
                        ],
                      ),
                      child: Icon(
                        CupertinoIcons.slider_horizontal_3,
                        size: 21,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            _loadMorePosts();
            setState(() {
              _isShowingBottomBar = notification.metrics.extentAfter > 0;
            });
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // Add your CarouselSlider here
              // SizedBox(height: 5,),
              Container(
                height: 200,
                color: Colors.blue,
                width: double.infinity,
                child: CarouselSlider(
                  items: items,
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      // Handle page change event
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                width: double.infinity,
                // color: Colors.white,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("all ads"),
                    Container(
                      width: 70,
                      height: 33,
                      padding: EdgeInsets.all(5),
                      // color: Colors.amberAccent,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Consumer<AdsProvider>(
                        builder: (context, provider, child) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  provider.toggleSelection("Left");
                                  print(">>>");
                                  setState(() {
                                    adLayout = 2;
                                  });
                                },
                                child: Container(
                                  width: 31,
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: provider.isLeftIconSelected
                                        ? Colors.grey[300]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    CupertinoIcons.square_grid_2x2_fill,
                                    size: 12,
                                    color: provider.isLeftIconSelected
                                        ? Colors.grey[500]
                                        : Colors.grey[700],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  provider.toggleSelection("Right");
                                  setState(() {
                                    adLayout = 1;
                                  });
                                },
                                child: Container(
                                  width: 26,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: provider.isRightIconSelected
                                        ? Colors.grey[300]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    CupertinoIcons.rectangle_grid_1x2_fill,
                                    size: 12,
                                    color: provider.isRightIconSelected
                                        ? Colors.grey[500]
                                        : Colors.grey[700],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

//////////////////////
              ///
// CustomAdsCardShimmer(),
              // CustomAdsCardShimmer(adLayout: adLayout, size: size),

              ////////////
              Consumer<AdsProvider>(
                builder: (context, controller, child) {
                  if (controller.getPosts.isEmpty &&
                      controller.currentPage == 1) {
                    return 
                      CustomAdsCardShimmer(adLayout: adLayout, size: size);
                    //  SizedBox.shrink();
                  } 
                  // else if (controller.getPosts.isEmpty) {
                  //   return  Center(child: 
                  //   CustomAdsCardShimmer(adLayout: adLayout, size: size)
                  //   // CircularProgressIndicator()
                  //   );
                  // }
                   else {
                    return MasonryGridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.getPosts.length,
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: adLayout,
                      ),
                      itemBuilder: (context, index) {
                        final post = controller.getPosts[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              '/view-post-details',
                              arguments: {'post': post},
                              preventDuplicates: false,
                              parameters: {'transition': 'cupertino'},
                              // transition: Transition.cupertino,
                              // fullscreenDialog: true,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: Container(
                                          // height: 160,
                                          alignment: Alignment
                                              .center, // Add this line to center the child
                                          child: CachedNetworkImage(
                                            imageUrl: baseUrl +
                                                "public/images/Ads/" +
                                                post.mainImage,
                                            placeholder: (context, url) =>
                                                const SkeletonAvatar(
                                              style: SkeletonAvatarStyle(
                                                width: double.infinity,
                                                height:
                                                    160, // Match the Image height
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 1),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.orange.withOpacity(0.5),
                                            borderRadius: BorderRadius.only(
                                                // topRight: Radius.circular(10),
                                                // bottomLeft: Radius.circular(10),
                                                ),
                                          ),
                                          child: const Text(
                                            'Featured',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 59,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.8),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: const Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Urgent",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    // height: 125,
                                    width: double
                                        .infinity, // or any specific width value
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                width: size.width / 2.4,
                                                child: Text(
                                                  post.title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'instructor',
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                post.price,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: size.width / 2.4,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 2,
                                                              bottom: 7),
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3,
                                                              bottom: 3,
                                                              left: 0,
                                                              right: 7),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 222, 249, 227),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            CupertinoIcons
                                                                .checkmark_seal_fill,
                                                            color: Constants
                                                                .themeColor,
                                                            size: 19,
                                                          ),
                                                          Text(
                                                            "Verified",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8,
                                                              bottom: 10),
                                                      child: Text(
                                                        "23 minutes ago",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[800],
                                                            fontSize: 11),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              if (Provider.of<AdsProvider>(context).isLoadingMore)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        ),
      ),
    );
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
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 43.0, // Set the height here
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

class CarousalBottomBlackLine extends StatelessWidget {
  const CarousalBottomBlackLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, const Color.fromARGB(255, 45, 45, 45)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.7, 1],
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),

            const SizedBox(
              height: 8,
            ),

            const SizedBox(
              height: 8,
            ),
            Text(
              "Xiaomi Redmi Note 13 5G ",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Text(
              "Rs. 2500000.00",
              style: TextStyle(color: Colors.cyanAccent),
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: Constants.themeColor,
                  size: 19,
                ),
                Text(
                  "Verified",
                  style: TextStyle(
                    color: Constants.themeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            // detailsScreen(),
          ],
        ),
      ),
    );
  }
}
