import 'package:classic_ads/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../Components/app_bar_button.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
    required this.size,
    required this.imageUrl,
  });

  final Size size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Stack(
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias, // Default value
            child: Image.network(
              baseUrl + "public/images/Ads/" + imageUrl,
              width: size.width, // Set the width to the device width
              // height: size.height *
              //     0.3, // Set the height to 30% of the device height
              fit: BoxFit.cover, // Adjust the image fit as desired
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: double.infinity,
                    height: 300, // Match the Image height
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
