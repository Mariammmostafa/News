/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/splash_logo_dark.png
  AssetGenImage get splashLogoDark =>
      const AssetGenImage('assets/icons/splash_logo_dark.png');

  /// File path: assets/icons/splash_logo_light.png
  AssetGenImage get splashLogoLight =>
      const AssetGenImage('assets/icons/splash_logo_light.png');

  /// List of all assets
  List<AssetGenImage> get values => [splashLogoDark, splashLogoLight];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/Health.jpg
  AssetGenImage get health => const AssetGenImage('assets/image/Health.jpg');

  /// File path: assets/image/buisn.jpg
  AssetGenImage get buisn => const AssetGenImage('assets/image/buisn.jpg');

  /// File path: assets/image/buisness.jpg
  AssetGenImage get buisness =>
      const AssetGenImage('assets/image/buisness.jpg');

  /// File path: assets/image/enter.jpg
  AssetGenImage get enter => const AssetGenImage('assets/image/enter.jpg');

  /// File path: assets/image/enterm.jpg
  AssetGenImage get enterm => const AssetGenImage('assets/image/enterm.jpg');

  /// File path: assets/image/general.jpg
  AssetGenImage get generalJpg =>
      const AssetGenImage('assets/image/general.jpg');

  /// File path: assets/image/general.png
  AssetGenImage get generalPng =>
      const AssetGenImage('assets/image/general.png');

  /// File path: assets/image/science.jpg
  AssetGenImage get science => const AssetGenImage('assets/image/science.jpg');

  /// File path: assets/image/sience.jpg
  AssetGenImage get sience => const AssetGenImage('assets/image/sience.jpg');

  /// File path: assets/image/splash.jpg
  AssetGenImage get splash => const AssetGenImage('assets/image/splash.jpg');

  /// File path: assets/image/sports.jpg
  AssetGenImage get sports => const AssetGenImage('assets/image/sports.jpg');

  /// File path: assets/image/techn.jpg
  AssetGenImage get techn => const AssetGenImage('assets/image/techn.jpg');

  /// File path: assets/image/technology.jpg
  AssetGenImage get technology =>
      const AssetGenImage('assets/image/technology.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        health,
        buisn,
        buisness,
        enter,
        enterm,
        generalJpg,
        generalPng,
        science,
        sience,
        splash,
        sports,
        techn,
        technology
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
