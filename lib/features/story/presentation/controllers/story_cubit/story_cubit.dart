import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/controller/story_controller.dart';
import 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  @override
  Future<void> close() {
    // dispose
    storyController.pause();
    storyController.dispose();

    print('stroy closed');
    return super.close();
  }

  StoryCubit() : super(StoryInitialState());

  static StoryCubit get(context) => BlocProvider.of(context);

  StoryController storyController = StoryController();
}
