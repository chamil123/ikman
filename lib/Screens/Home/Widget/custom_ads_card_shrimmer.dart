import 'package:cached_network_image/cached_network_image.dart';
import 'package:classic_ads/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/strings.dart';


class CustomAdsCardShimmer extends StatelessWidget {
  const CustomAdsCardShimmer({
    super.key,
    required this.adLayout,
    required this.size,
  });

  final int adLayout;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: adLayout,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor:
                      Colors.grey[300]!, // Base color for the shimmer
                  highlightColor: Colors.grey[100]!,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      height: (index % 5 + 1) * 100,
                      color: Colors.amber,
                    ),
                  ),
                ),
                Container(
                  // height: 125,
                  width:
                      double.infinity, // or any specific width value
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
                        Shimmer.fromColors(
                          baseColor: Colors.grey[
                              300]!, // Base color for the shimmer
                          highlightColor: Colors.grey[100]!,
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: Colors.amber,
                                width: size.width / 4,
                                height: 10,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 5,
                                color: Colors.amber,
                                width: size.width / 4,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 7,
                                    color: Colors.amber,
                                    width: size.width / 5,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Container(
                                    height: 7,
                                    color: Colors.amber,
                                    width: size.width / 5,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}