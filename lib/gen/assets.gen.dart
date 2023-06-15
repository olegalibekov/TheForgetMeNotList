/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/add.svg
  String get add => 'assets/svg/add.svg';

  /// File path: assets/svg/arrow_back.svg
  String get arrowBack => 'assets/svg/arrow_back.svg';

  /// File path: assets/svg/check.svg
  String get check => 'assets/svg/check.svg';

  /// File path: assets/svg/close.svg
  String get close => 'assets/svg/close.svg';

  /// File path: assets/svg/delete.svg
  String get delete => 'assets/svg/delete.svg';

  /// File path: assets/svg/info_outline.svg
  String get infoOutline => 'assets/svg/info_outline.svg';

  /// File path: assets/svg/priority_high.svg
  String get priorityHigh => 'assets/svg/priority_high.svg';

  /// File path: assets/svg/priority_low.svg
  String get priorityLow => 'assets/svg/priority_low.svg';

  /// File path: assets/svg/visibility.svg
  String get visibility => 'assets/svg/visibility.svg';

  /// File path: assets/svg/visibility_off.svg
  String get visibilityOff => 'assets/svg/visibility_off.svg';

  /// List of all assets
  List<String> get values => [
        add,
        arrowBack,
        check,
        close,
        delete,
        infoOutline,
        priorityHigh,
        priorityLow,
        visibility,
        visibilityOff
      ];
}

class Assets {
  Assets._();

  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
