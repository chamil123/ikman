import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../Components/appBarButton.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Stack(
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias, // Default value
            child: 
            Image.network(
              "https://www.kitchensanctuary.com/wp-content/uploads/2020/12/Quick-Chicken-Ramen-square-FS-22.jpg",
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return SkeletonAvatar(
                                                  style: SkeletonAvatarStyle(
                                                    width: double.infinity,
                                                    height:
                                                        300, // Match the Image height
                                                     
                                                  ),
                                                );
              },
              frameBuilder: (BuildContext context, Widget child, int? frame,
                  bool wasSynchronouslyLoaded) {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: child,
                );
              },
            ),
          ),
          SafeArea(
            child: AppBarButton(
              onTap: () {
                 Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
