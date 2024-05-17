import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  final String categoryName;
  final String categoryIconUrl;
  final List<String> items = [
    "iotems 1 ",
    "iotems 2 ",
    "iotems 3 ",
    "iotems 4 ",
    "iotems 2 ",
    "iotems 3 ",
    "iotems 4 ",
    "iotems 2 ",
    "iotems 3 ",
    "iotems 4 ",
    "iotems 2 ",
    "iotems 3 ",
    "iotems 4 ",
    "iotems 2 ",
    "iotems 3 ",
    "iotems 4 ",
    "iotems 5 "
  ];
  SubCategoryScreen({super.key, this.categoryName="",this.categoryIconUrl=""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Container(
                width: 50,
    height:50,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child:  CachedNetworkImage(
                  imageUrl: "https://demo.satasmewebdev.online/public/images/Category/"+categoryIconUrl,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  
                ),
              ),
            ),
            // const SizedBox(width: 20.0),
            // const Text('datadddddddddddddddddddddddddddddddddd'),
          ],
        ),
        title: Text(categoryName,style: TextStyle(
          fontSize: 16
        ),),
        actions: [
          IconButton(
            onPressed: () {
              // Handle close button press
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SizedBox(
        child: Column(
          children: [
            // Container(
            //   height: 100,
            //   color: Colors.amber,
            // ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    // var isLast=index= items.length - 1;
                    return Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Row(
                              children: [
                                const Icon(Icons.category),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  items[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
                        if (index != items.length - 1)
                          const Divider(thickness: 0.5),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
