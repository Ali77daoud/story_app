import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view_app/features/story/presentation/widgets/circle_indecator_screen.dart';
import '../controllers/main_cubit/main_cubit.dart';
import '../controllers/upload_story_cubit/upload_story_cubit.dart';
import '../controllers/upload_story_cubit/upload_story_state.dart';
import 'package:story_view_app/injection_container.dart' as di;

class UploadStoryPage extends StatelessWidget {
  const UploadStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.get(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: WillPopScope(
            onWillPop: () async {
              mainCubit.changeHomeToSuccessState();
              return true;
            },
            child: BlocProvider(
              create: (context) => di.sl<UploadStoryCubit>(),
              child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Upload Story'),
                    backgroundColor: Colors.white,
                    actions: const [],
                  ),
                  body: BlocConsumer<UploadStoryCubit, UploadStoryState>(
                    listener: (context, state) {
                      if (state is NoImageSelectedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Nothing is selected')));
                      }
                      if (state is NoVideoSelectedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Nothing is selected')));
                      }
                      if (state is SelectedVideoDurationFailedState) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Selected video duration should be less than 50 seconds.')));
                      }
                    },
                    builder: (context, state) {
                      final uploadStoryCubit = UploadStoryCubit.get(context);
                      return Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey)),
                                      child: const Text(
                                        'Select video from Gallery or Camera',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      onPressed: () {
                                        uploadStoryCubit.showPicker(
                                            context: context, isVideo: true);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey)),
                                      child: const Text(
                                        'Select image from Gallery or Camera',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      onPressed: () {
                                        uploadStoryCubit.showPicker(
                                            context: context, isVideo: false);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 200.0,
                                    width: 300.0,
                                    child: uploadStoryCubit.galleryFile == null
                                        ? const Center(
                                            child: Text(
                                                'Sorry nothing selected!!'))
                                        : Center(
                                            child: Text(uploadStoryCubit
                                                .galleryFile!.path)),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black)),
                                      child: const Text(
                                        'Upload Story',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          state ==
                                  const CheckVideoDurationLoadingState(
                                      isLoading: true)
                              ? const CircleIndicatorScreen()
                              : Container()
                        ],
                      );
                    },
                  )),
            )),
      ),
    );
  }
}
// class UploadStoryPage extends StatefulWidget {
//   const UploadStoryPage({super.key});

//   @override
//   State<UploadStoryPage> createState() => _UploadStoryPageState();
// }

// class _UploadStoryPageState extends State<UploadStoryPage> {
//   File? galleryFile;
//   final picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Upload Story'),
//             backgroundColor: Colors.white,
//             actions: const [],
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 40,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.grey)),
//                       child: const Text(
//                         'Select video from Gallery or Camera',
//                         style: TextStyle(fontSize: 13),
//                       ),
//                       onPressed: () {
//                         _showPicker(context: context, isVideo: true);
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 40,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.grey)),
//                       child: const Text(
//                         'Select image from Gallery or Camera',
//                         style: TextStyle(fontSize: 13),
//                       ),
//                       onPressed: () {
//                         _showPicker(context: context, isVideo: false);
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     height: 200.0,
//                     width: 300.0,
//                     child: galleryFile == null
//                         ? const Center(child: Text('Sorry nothing selected!!'))
//                         : Center(child: Text(galleryFile!.path)),
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 40,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.black)),
//                       child: const Text(
//                         'Upload Story',
//                         style: TextStyle(fontSize: 13, color: Colors.white),
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }

//   void _showPicker({
//     required BuildContext context,
//     required bool isVideo,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   isVideo
//                       ? getVideo(ImageSource.gallery)
//                       : getImage(ImageSource.gallery);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_camera),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   isVideo
//                       ? getVideo(ImageSource.camera)
//                       : getImage(ImageSource.camera);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future getVideo(
//     ImageSource imgSource,
//   ) async {
//     final pickedFile = await picker.pickVideo(
//         source: imgSource,
//         preferredCameraDevice: CameraDevice.front,
//         maxDuration: const Duration(seconds: 5));

//     XFile? xfilePick = pickedFile;
//     setState(
//       () {
//         if (xfilePick != null) {
//           if (imgSource == ImageSource.gallery) {
//             final videoPlayerController =
//                 VideoPlayerController.file(File(pickedFile!.path));
//             videoPlayerController.initialize().then((value) {
//               if (videoPlayerController.value.duration.inSeconds <= 50) {
//                 galleryFile = File(pickedFile.path);
//               } else {
//                 // ignore: use_build_context_synchronously
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     content: Text(
//                         'Selected video duration should be less than 50 seconds.')));
//               }
//             });
//           } else {
//             print('Camera Video Selected');
//             galleryFile = File(pickedFile!.path);
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
//               const SnackBar(content: Text('Nothing is selected')));
//         }
//       },
//     );
//   }

//   Future getImage(
//     ImageSource img,
//   ) async {
//     final pickedFile = await picker.pickImage(
//       source: img,
//       preferredCameraDevice: CameraDevice.front,
//     );

//     XFile? xfilePick = pickedFile;

//     setState(
//       () {
//         if (xfilePick != null) {
//           galleryFile = File(pickedFile!.path);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
//               const SnackBar(content: Text('Nothing is selected')));
//         }
//       },
//     );
//   }
// }
