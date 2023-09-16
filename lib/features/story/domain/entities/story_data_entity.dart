import 'package:equatable/equatable.dart';

class StoryDataEntity extends Equatable {
  // final bool isSuccessful;
  // final bool hasContent;
  // final int code;
  final DataEntity data;

  const StoryDataEntity({
    // required this.isSuccessful,
    // required this.hasContent,
    // required this.code,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        // isSuccessful,
        //  hasContent,
        //   code,
        data
      ];
}

class DataEntity extends Equatable {
  // final int currentPage;
  final List<DatumEntity> data;
  // final String firstPageUrl;
  // final int from;
  // final int lastPage;
  // final String lastPageUrl;
  // final List<LinkEntity> links;
  // final dynamic nextPageUrl;
  // final String path;
  // final int perPage;
  // final dynamic prevPageUrl;
  // final int to;
  // final int total;

  const DataEntity({
    // required this.currentPage,
    required this.data,
    // required this.firstPageUrl,
    // required this.from,
    // required this.lastPage,
    // required this.lastPageUrl,
    // required this.links,
    // required this.nextPageUrl,
    // required this.path,
    // required this.perPage,
    // required this.prevPageUrl,
    // required this.to,
    // required this.total,
  });

  @override
  List<Object?> get props => [
        // currentPage,
        data,
        // firstPageUrl,
        // from,
        // lastPage,
        // lastPageUrl,
        // links,
        // path,
        // perPage,
        // prevPageUrl,
        // to,
        // total
      ];
}

class DatumEntity extends Equatable {
  // final int id;
  // final String mobilePhone;
  // final dynamic photoPath;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  // final dynamic deletedAt;
  // final dynamic createdByUserId;
  // final dynamic updatedByUserId;
  // final dynamic deletedByUserId;
  // final int isLockedByAdminForDelete;
  // final int isLockedByAdminForUpdate;
  // final String name;
  // final dynamic username;
  // final dynamic originalUserId;
  final List<StoryEntity> stories;

  DatumEntity({
    // required this.id,
    // required this.mobilePhone,
    // required this.photoPath,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.deletedAt,
    // required this.createdByUserId,
    // required this.updatedByUserId,
    // required this.deletedByUserId,
    // required this.isLockedByAdminForDelete,
    // required this.isLockedByAdminForUpdate,
    // required this.name,
    // required this.username,
    // required this.originalUserId,
    required this.stories,
  });

  @override
  List<Object?> get props => [];
}

class StoryEntity extends Equatable {
  final int id;
  // final dynamic cutVideoName;
  // final dynamic cutVideoPath;
  // final dynamic fullVideoName;
  final String? fullVideoPath;
  // final dynamic storageVideoPath;
  // final int userId;
  final int isPhoto;
  final int isVideo;
  final String? photoPath;

  const StoryEntity({
    required this.id,
    // required this.cutVideoName,
    // required this.cutVideoPath,
    // required this.fullVideoName,
    required this.fullVideoPath,
    // required this.storageVideoPath,
    // required this.userId,
    required this.isPhoto,
    required this.isVideo,
    required this.photoPath,
  });
  @override
  List<Object?> get props => [];
}

// class LinkEntity extends Equatable {
//   final String? url;
//   final String label;
//   final bool active;

//   const LinkEntity({
//     required this.url,
//     required this.label,
//     required this.active,
//   });
//   @override
//   List<Object?> get props => [];
// }
