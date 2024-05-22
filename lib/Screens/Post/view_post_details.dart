import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:classic_ads/utils/constant.dart';

import '../Components/app_bar_button.dart';
import 'Widgets/upper_section.dart';
import 'Widgets/verified_member_bar.dart';

class ViewPostDetails extends StatelessWidget {
    final String imageUrl;
  const ViewPostDetails({super.key, required this.imageUrl,});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperSection(size: size,imageUrl:imageUrl),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Honda CRV 7 Seater SUV 2018",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "12 minutes ago",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    "Rs. 2325000.00",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      
                  // Container()
                ],
              ),
            ),
           const Padding(
              padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.placemark_fill,
                    color: Constants.themeColor,
                  ),
                  Text(
                    "no 175/6/B new kandy road, Kadawatha 11850",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ],
              ),
            ),
            VerifiedMemberBar(),
            Divider(
              thickness: 0.7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Service type",
                            style:
                                TextStyle(fontSize: 13, color: Colors.grey[600]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Category",
                            style:
                                TextStyle(fontSize: 13, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      SizedBox(width: size.width / 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [Text("Leasing & loans")],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Auto Service",
                            style:
                                TextStyle(fontSize: 13, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                 const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and "),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
