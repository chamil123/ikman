import 'package:classic_ads/Model/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:classic_ads/utils/constant.dart';

import '../Components/app_bar_button.dart';
import 'Widgets/upper_section.dart';
import 'Widgets/verified_member_bar.dart';
import 'package:timeago/timeago.dart' as timeago;
class ViewPostDetails extends StatelessWidget {
    final Post post;
  const ViewPostDetails({super.key, required this.post,});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperSection(size: size,imageUrl:post.mainImage),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                  ),
                  Text(
                     timeago.format(DateTime.parse(
                                                    post.createdAt)),
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    post.price,
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
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.placemark_fill,
                    color: Constants.themeColor,
                  ),
                  Text(
                    '${post.mainLocation!.nameEn}, ' '${post.subLocation!.nameEn}',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                
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
                  Column(
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
                          '${post.description}'),
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
