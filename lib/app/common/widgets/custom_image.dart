
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/get_rx.dart';

import '../app_images/app_images.dart';



enum ImageType { png, svg, network }

class CustomImage extends StatefulWidget {
  final String imageSrc;
  final String defaultImage;
  final Color? imageColor;
  final double height;
  final double? width;
  final double borderRadius;
  final ImageType imageType;
  final BoxFit fill;

  const CustomImage({
    required this.imageSrc,
    this.imageColor,
    this.height = 24,
    this.borderRadius = 10,
    this.width,
    this.imageType = ImageType.svg,
    this.fill = BoxFit.fill,
    this.defaultImage = AppImages.noImage,
    super.key,
  });

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  RxBool notNetworkError = true.obs;

  late Widget imageWidget;

  @override
  Widget build(BuildContext context) {
    if (widget.imageType == ImageType.svg) {
      imageWidget = SvgPicture.asset(
        widget.imageSrc,
        color: widget.imageColor,
        height: widget.height,
        width: widget.width,
        fit: widget.fill,
      );
    }

    if (widget.imageType == ImageType.png) {
      imageWidget = Image.asset(
        widget.imageSrc,
        color: widget.imageColor,
        height: widget.height,
        width: widget.width,
        fit: widget.fill,
        errorBuilder: (context, error, stackTrace) {
          if (kDebugMode) {
            print("imageError : $error");
          }
          return Image.asset(widget.defaultImage);
        },
      );
    }

    if (widget.imageType == ImageType.network) {
      imageWidget =  CachedNetworkImage(
        height: widget.height.h,
        width: widget.width ?? widget.height.h,
        imageUrl: widget.imageSrc,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Image.asset(fit: BoxFit.fill,
          widget.defaultImage,
        ),
      );
    }

    return SizedBox(
        height: widget.height, width: widget.width, child: imageWidget);
  }
}