import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../motion/app_motion.dart';

/// Image that works offline from the first launch.
///
/// The bundled [asset] is what shows when there is no [url], while a remote
/// image loads, and if it fails. Remote images are cached on disk by
/// `cached_network_image`, so they also survive airplane mode after one view.
class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.asset,
    this.url,
    this.fit = BoxFit.cover,
  });

  final String asset;
  final String? url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final remote = url;
    if (remote == null) return _fallback();
    return CachedNetworkImage(
      imageUrl: remote,
      fit: fit,
      fadeInDuration: AppMotion.resolve(context, AppMotion.fast),
      placeholder: (_, _) => _fallback(),
      errorWidget: (_, _, _) => _fallback(),
    );
  }

  Widget _fallback() => Image.asset(asset, fit: fit);
}
