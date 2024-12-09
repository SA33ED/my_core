import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_loading_indicator.dart';

CachedNetworkImage displayCachedNetworkImage({
  required String imageUrl,
  BoxFit? fit,
  double? height,
  double? width,
}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: fit ?? BoxFit.fill,
    placeholder: (context, url) => CustomLoadingIndicator(
      height: 32.h,
    ),
    errorWidget: (context, url, error) => Icon(
      Icons.image,
      size: width ?? 32.w,
    ),
    height: height,
    width: width ?? double.infinity,
  );
}

displayProviderCachedNetworkImage({
  required String imageUrl,
}) {
  return CachedNetworkImageProvider(
    imageUrl,
  );
}
