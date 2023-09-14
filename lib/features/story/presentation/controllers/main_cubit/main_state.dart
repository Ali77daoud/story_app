import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitialState extends MainState {}

class ShowStoryState extends MainState {
  final int index;

  const ShowStoryState({required this.index});

  @override
  List<Object> get props => [index];
}

class MoveToStoryPageState extends MainState {
  final int index;

  const MoveToStoryPageState({required this.index});
  @override
  List<Object> get props => [index];
}

class StoryImgExpandedState extends MainState {
  final int index;
  final bool isEx;

  const StoryImgExpandedState({required this.index, required this.isEx});
  @override
  List<Object> get props => [index, isEx];
}

class ProfileImgExpandedState extends MainState {
  final int index;
  final bool isEx;

  const ProfileImgExpandedState({required this.index, required this.isEx});
  @override
  List<Object> get props => [index, isEx];
}
