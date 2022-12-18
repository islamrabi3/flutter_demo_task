import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Widget cacheNetworkImageCustom({String? image, IconData? icon}) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    imageUrl: image!,
    placeholder: (context, url) => const CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(icon),
    cacheManager: CacheManager(Config(
      "fluttercampus",
      stalePeriod: const Duration(days: 7),
      //one week cache period
    )),
  );
}
