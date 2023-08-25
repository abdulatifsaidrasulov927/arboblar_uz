import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WebsiteShimmer extends StatefulWidget {
  const WebsiteShimmer({super.key});

  @override
  State<WebsiteShimmer> createState() => _WebsiteShimmerState();
}

class _WebsiteShimmerState extends State<WebsiteShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: const SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 100,
                width: 200,
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 100,
                width: 200,
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 100,
                width: 200,
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 100,
                width: 200,
              ),
            ],
          ),
        ));
  }
}
