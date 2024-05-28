import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';

class ImageAutoReload extends StatefulWidget {
  final String name;
  final String imageUrl;
  final double containerWidth;
  final double containerHeight;
  final BoxFit imageFit;
  final BorderRadius containerBorderRadius;

  const ImageAutoReload({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.containerWidth,
    required this.containerHeight,
    required this.imageFit,
    required this.containerBorderRadius,
  });

  @override
  State<ImageAutoReload> createState() => _ImageAutoReloadState();
}

class _ImageAutoReloadState extends State<ImageAutoReload> {
  // state
  Timer? _reloadTimer;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void dispose() {
    _reloadTimer?.cancel();
    super.dispose();
  }

  // void _loadImage(){
  //   setState(() {});
  // }

  void _retryLoadImage(){
    _reloadTimer?.cancel();
    _reloadTimer = Timer.periodic(const Duration(milliseconds: 400), (_){
      if(mounted){
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.containerBorderRadius,
      child: Stack(
        children: [
          Container(
            width: widget.containerWidth,
            height: widget.containerHeight,
            color: custGreyColor,
          ),
          // TODO: IMAGE NETWORK
          Image.network(
            widget.imageUrl,
            width: widget.containerWidth,
            height: widget.containerHeight,
            fit: widget.imageFit,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
              if(loadingProgress == null){
                return child;
              } else {
                return Shimmer.fromColors(
                  baseColor: custGreyColor,
                  highlightColor: custShadowColor,
                  child: Container(
                    width: widget.containerWidth,
                    height: widget.containerHeight,
                    color: custPrimaryColor,
                  ),
                );
              }
            },
            errorBuilder: (_, __, ___){
              _retryLoadImage();
              return Shimmer.fromColors(
                baseColor: custGreyColor,
                highlightColor: custShadowColor,
                child: Container(
                  width: widget.containerWidth,
                  height: widget.containerHeight,
                  color: custPrimaryColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
