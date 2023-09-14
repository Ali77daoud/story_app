import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:story_view_app/features/story/presentation/controllers/story_cubit/story_cubit.dart';
import 'package:story_view_app/features/story/presentation/controllers/story_cubit/story_state.dart';
import 'package:story_view_app/injection_container.dart' as di;

import '../../../../data.dart';
import '../../data/models/story_model.dart';
import '../controllers/main_cubit/main_cubit.dart';

class StoryViewPage extends StatelessWidget {
  const StoryViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.get(context);
    return BlocProvider(
        create: (context) => di.sl<StoryCubit>(),
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: Scaffold(body: BlocBuilder<StoryCubit, StoryState>(
                builder: (context, state) {
                  final storyCubit = StoryCubit.get(context);
                  int currentIndex = mainCubit.currentIndex;
                  return StoryView(
                    controller: storyCubit.storyController,
                    storyItems: [
                      for (int i = currentIndex; i < stories.length; i++)
                        stories[i].media == MediaType.video
                            ? StoryItem.pageVideo(stories[i].url,
                                duration: stories[i].duration,
                                controller: storyCubit.storyController)
                            : StoryItem.inlineImage(
                                imageFit: BoxFit.contain,
                                url: (stories[i].url),
                                controller: storyCubit.storyController,
                                duration: stories[i].duration),
                    ],
                    onStoryShow: (s) async {
                      await Future.delayed(const Duration(microseconds: 1));
                      mainCubit.showStory(currentIndex);
                      print(currentIndex);
                      currentIndex += 1;
                    },
                    onComplete: () {
                      print('Story Completed');
                    },
                    progressPosition: ProgressPosition.top,
                    repeat: false,
                    inline: true,
                  );
                },
              )),
            ),
          ),
        ));
  }
}
