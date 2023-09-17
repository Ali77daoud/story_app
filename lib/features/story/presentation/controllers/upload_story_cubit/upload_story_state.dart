import 'package:equatable/equatable.dart';

abstract class UploadStoryState extends Equatable {
  const UploadStoryState();

  @override
  List<Object> get props => [];
}

class UploadStoryInitialState extends UploadStoryState {}

//video

class CheckVideoDurationLoadingState extends UploadStoryState {
  final bool isLoading;
  const CheckVideoDurationLoadingState({required this.isLoading});
  @override
  List<Object> get props => [isLoading];
}

class SelectedVideoDurationFailedState extends UploadStoryState {
  const SelectedVideoDurationFailedState();
  @override
  List<Object> get props => [];
}

class ChooseVideoSuccessState extends UploadStoryState {
  final String pickedFile;
  const ChooseVideoSuccessState({required this.pickedFile});
  @override
  List<Object> get props => [pickedFile];
}

class NoVideoSelectedState extends UploadStoryState {
  const NoVideoSelectedState();
  @override
  List<Object> get props => [];
}
//image

class ChooseImageSuccessState extends UploadStoryState {
  final String pickedFile;
  const ChooseImageSuccessState({required this.pickedFile});
  @override
  List<Object> get props => [pickedFile];
}

class NoImageSelectedState extends UploadStoryState {
  const NoImageSelectedState();
  @override
  List<Object> get props => [];
}
