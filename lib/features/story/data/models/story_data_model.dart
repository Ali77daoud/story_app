import 'package:story_view_app/features/story/domain/entities/story_data_entity.dart';

class StoryDataModel extends StoryDataEntity {
  const StoryDataModel(
      {required bool isSuccessful,
      required bool hasContent,
      required int code,
      required DataModel data})
      : super(
            isSuccessful: isSuccessful,
            hasContent: hasContent,
            code: code,
            data: data);

  factory StoryDataModel.fromJson(Map<String, dynamic> json) => StoryDataModel(
        isSuccessful: json["isSuccessful"],
        hasContent: json["hasContent"],
        code: json["code"],
        data: DataModel.fromJson(json["data"]),
      );
}

class DataModel extends DataEntity {
  const DataModel({
    required int currentPage,
    required List<DatumModel> data,
    required String firstPageUrl,
    required int from,
    required int lastPage,
    required String lastPageUrl,
    required List<LinkModel> links,
    // required int nextPageUrl,
    required String path,
    required int perPage,
    required int prevPageUrl,
    required int to,
    required int total,
  }) : super(
            currentPage: currentPage,
            data: data,
            firstPageUrl: firstPageUrl,
            from: from,
            lastPageUrl: lastPageUrl,
            links: links,
            path: path,
            perPage: perPage,
            prevPageUrl: prevPageUrl,
            to: to,
            total: total,
            lastPage: lastPage);

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        currentPage: json["current_page"],
        data: List<DatumModel>.from(
            json["data"].map((x) => DatumModel.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<LinkModel>.from(
            json["links"].map((x) => LinkModel.fromJson(x))),
        // nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class DatumModel extends DatumEntity {
  DatumModel({
    required int id,
    required String mobilePhone,
    // required this.photoPath,
    required DateTime createdAt,
    required DateTime updatedAt,
    // required this.deletedAt,
    // required this.createdByUserId,
    // required this.updatedByUserId,
    // required this.deletedByUserId,
    required int isLockedByAdminForDelete,
    required int isLockedByAdminForUpdate,
    required String name,
    // required this.username,
    // required this.originalUserId,
    required List<StoryModel> stories,
  }) : super(
          id: id,
          createdAt: createdAt,
          isLockedByAdminForDelete: isLockedByAdminForDelete,
          isLockedByAdminForUpdate: isLockedByAdminForUpdate,
          mobilePhone: mobilePhone,
          name: name,
          // originalUserId: originalUserId,
          stories: stories,
          updatedAt: updatedAt,
        );

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        id: json["id"],
        mobilePhone: json["mobile_phone"],
        // photoPath: json["photo_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        // createdByUserId: json["created_by_user_id"],
        // updatedByUserId: json["updated_by_user_id"],
        // deletedByUserId: json["deleted_by_user_id"],
        isLockedByAdminForDelete: json["is_locked_by_admin_for_delete"],
        isLockedByAdminForUpdate: json["is_locked_by_admin_for_update"],
        name: json["name"],
        // username: json["username"],
        // originalUserId: json["original_user_id"],
        stories: List<StoryModel>.from(
            json["stories"].map((x) => StoryModel.fromJson(x))),
      );
}

class StoryModel extends StoryEntity {
  const StoryModel({
    required int id,
    // required this.cutVideoName,
    // required this.cutVideoPath,
    // required this.fullVideoName,
    required String fullVideoPath,
    // required this.storageVideoPath,
    required int userId,
    required int isPhoto,
    required int isVideo,
    // required this.photoPath,
  }) : super(
            id: id,
            fullVideoPath: fullVideoPath,
            isPhoto: isPhoto,
            isVideo: isVideo,
            userId: userId);

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json["id"],
        // cutVideoName: json["cut_video_name"],
        // cutVideoPath: json["cut_video_path"],
        // fullVideoName: json["full_video_name"],
        fullVideoPath: json["full_video_path"],
        // storageVideoPath: json["storage_video_path"],
        userId: json["user_id"],
        isPhoto: json["is_photo"],
        isVideo: json["is_video"],
        // photoPath: json["photo_path"],
      );
}

class LinkModel extends LinkEntity {
  LinkModel({
    String? url,
    required String label,
    required bool active,
  }) : super(url: url!, active: active, label: label);

  factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );
}
