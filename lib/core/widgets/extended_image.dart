import 'package:extended_image/extended_image.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:coin_market/core/utils/import.dart';

class ExtendedImageWidget extends HookWidget {
  final String? url;
  final String? assetPath;
  final File? file;
  final Uint8List? memory;
  final double width;
  final double height;
  final BoxFit fit;
  final double borderRadius;

  const ExtendedImageWidget._({
    this.url,
    this.assetPath,
    this.file,
    this.memory,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 8.0,
  });

  /// Factory constructor for loading network images
  factory ExtendedImageWidget.network(
    String url, {
    double width = 100,
    double height = 100,
    BoxFit fit = BoxFit.cover,
    double borderRadius = 8.0,
  }) {
    return ExtendedImageWidget._(
      url: url,
      width: width,
      height: height,
      fit: fit,
      borderRadius: borderRadius,
    );
  }

  /// Factory constructor for loading asset images
  factory ExtendedImageWidget.asset(
    String assetPath, {
    double width = 100,
    double height = 100,
    BoxFit fit = BoxFit.cover,
    double borderRadius = 8.0,
  }) {
    return ExtendedImageWidget._(
      assetPath: assetPath,
      width: width,
      height: height,
      fit: fit,
      borderRadius: borderRadius,
    );
  }

  /// Factory constructor for loading file images
  factory ExtendedImageWidget.file(
    File file, {
    double width = 100,
    double height = 100,
    BoxFit fit = BoxFit.cover,
    double borderRadius = 8.0,
  }) {
    return ExtendedImageWidget._(
      file: file,
      width: width,
      height: height,
      fit: fit,
      borderRadius: borderRadius,
    );
  }

  /// Factory constructor for loading memory images
  factory ExtendedImageWidget.memory(
    Uint8List memory, {
    double width = 100,
    double height = 100,
    BoxFit fit = BoxFit.cover,
    double borderRadius = 8.0,
  }) {
    return ExtendedImageWidget._(
      memory: memory,
      width: width,
      height: height,
      fit: fit,
      borderRadius: borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    final placeholder = useMemoized(
      () => const Center(child: CircularProgressIndicator()),
    );
    final errorWidget = useMemoized(
      () => const Center(child: Icon(Icons.error, color: Colors.red, size: 40)),
    );

    Widget imageWidget;

    if (url != null) {
      imageWidget = ExtendedImage.network(
        url!,
        width: width.w,
        height: height.h,
        fit: fit,
        cache: true,
        borderRadius: BorderRadius.circular(borderRadius),
        shape: BoxShape.rectangle,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return placeholder;
            case LoadState.failed:
              return errorWidget;
            default:
              return null;
          }
        },
      );
    } else if (assetPath != null) {
      imageWidget = ExtendedImage.asset(
        assetPath!,
        width: width.w,
        height: height.h,
        fit: fit,
        borderRadius: BorderRadius.circular(borderRadius),
        shape: BoxShape.rectangle,
      );
    } else if (file != null) {
      imageWidget = ExtendedImage.file(
        file!,
        width: width.w,
        height: height.h,
        fit: fit,
        borderRadius: BorderRadius.circular(borderRadius),
        shape: BoxShape.rectangle,
      );
    } else if (memory != null) {
      imageWidget = ExtendedImage.memory(
        memory!,
        width: width.w,
        height: height.h,
        fit: fit,
        borderRadius: BorderRadius.circular(borderRadius),
        shape: BoxShape.rectangle,
      );
    } else {
      imageWidget = errorWidget;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: imageWidget,
    );
  }
}
