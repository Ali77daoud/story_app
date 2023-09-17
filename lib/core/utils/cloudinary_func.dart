import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/transformation/delivery/delivery.dart';
import 'package:cloudinary_url_gen/transformation/delivery/delivery_actions.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';

class CloudinaryFunc {
  static String videoCloudinaryTransform(String publicId) {
    String vUrl = CloudinaryContext.cloudinary
        .video(publicId)
        .transformation(
            Transformation()..delivery(Delivery.quality(Quality.auto())))
        .toString();

    return vUrl;
  }

  static String imageCloudinaryTransform(String publicId) {
    String imgUrl = CloudinaryContext.cloudinary
        .image(publicId)
        .transformation(
            Transformation()..delivery(Delivery.quality(Quality.auto())))
        .toString();

    return imgUrl;
  }

  static String extractPublicID(String url) {
    // Find the last occurrence of "/v" and the next occurrence of "."
    int startIndex = url.lastIndexOf("/v") + 2;
    int endIndex = url.lastIndexOf(".");

    if (startIndex >= 0 && endIndex > startIndex) {
      return url.substring(startIndex, endIndex).split('/')[1];
    } else {
      return "Public ID not found";
    }
  }
}
