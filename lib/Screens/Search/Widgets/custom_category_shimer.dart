import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 3.18,
      height: size.height / 7,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          border: Border.all(color: Colors.grey, width: 0.3)),
      child: const Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SkeletonAvatar(
            style: SkeletonAvatarStyle(
                width: double.infinity,
                height: 70, // Match the Image height
                shape: BoxShape.circle),
          ),
        
        ),
        // Text(category.name),
      ),
    );
  }
}
