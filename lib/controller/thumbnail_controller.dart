import 'dart:developer';
import 'package:video_thumbnail/video_thumbnail.dart';

class ThumbnailController {
  Future<String> getThumbnail({required String video}) async {
    log('enter');
    final String? fileName = await VideoThumbnail.thumbnailFile(
      video: video,
      imageFormat: ImageFormat.PNG,
      quality: 100,
    );
    log('finish');
    return fileName!;
  }
}
