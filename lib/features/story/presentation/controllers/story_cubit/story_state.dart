import 'package:equatable/equatable.dart';

abstract class StoryState extends Equatable {
  const StoryState();

  @override
  List<Object> get props => [];
}

class StoryInitialState extends StoryState {}

// class ChooseValueFromDropDownState extends BookingState {
//   final DropDownType type;
//   final String value;

//   const ChooseValueFromDropDownState({required this.value, required this.type});

//   @override
//   List<Object> get props => [value, type];
// }

