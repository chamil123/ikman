import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomSubCategoryShimmer extends StatelessWidget {
  const CustomSubCategoryShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal :15.0,vertical: 0),
      child: Shimmer.fromColors(
          baseColor:
              Colors.grey[300]!, // Base color for the shimmer
          highlightColor:
              Colors.grey[100]!, // Highlight color for the shimmer
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color:
                      Colors.white, // Placeholder for the image box
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 16,
                        color: Colors
                            .white, // Placeholder for the item name
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 12,
                        color: Colors
                            .white, // Placeholder for the description
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
