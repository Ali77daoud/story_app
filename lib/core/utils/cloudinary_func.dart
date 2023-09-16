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
}
