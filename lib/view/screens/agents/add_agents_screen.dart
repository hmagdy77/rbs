import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../../../libraries.dart';

class AgentsAddScreen extends StatelessWidget {
  const AgentsAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AgentsControllerImp agentsController =
        Get.find<AgentsControllerImp>();

    return ListView(
      children: [
        Container(
          width: double.infinity,
          color: AppColorManger.canvasColor,
          height: AppSizes.h08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    if (agentsController.file == null) {
                      showSnakString(
                          context: context, label: AppStrings.choeseImage);
                    } else {
                      agentsController.addAgent(context: context);
                    }
                  },
                  icon: const Icon(
                    Icons.add,
                    color: AppColorManger.white,
                  )),
              IconButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  );
                  if (result != null) {
                    agentsController.file = File(result.files.single.path!);
                  } else {}
                },
                icon: const Icon(
                  Icons.camera_alt,
                  color: AppColorManger.white,
                ),
              ),
              const Spacer(),
              Text(
                AppStrings.agentsAdd,
                style: context.textTheme.displayMedium!
                    .copyWith(color: AppColorManger.white),
              ),
              const Spacer(),
            ],
          ),
        ),
        InfoWidget(),
        FaceBookWidget(
          fbPosts: agentsController.fbPosts,
          fbRells: agentsController.fbRells,
          fbStorys: agentsController.fbStorys,
          fbVideos: agentsController.fbVideos,
        ),
        InstgramWidget(
          insPosts: agentsController.insPosts,
          insStorys: agentsController.insStorys,
          insRells: agentsController.insRells,
          insVideos: agentsController.insVideos,
          insHighlight: agentsController.insHighlight,
        ),
        DesignWidget(
          dsCover: agentsController.dsCover,
          dsFrame: agentsController.dsFrame,
          dsPosts: agentsController.dsPosts,
        ),
        YoutubeWidget(
          ytVideos: agentsController.ytVideos,
          ytShorts: agentsController.ytShorts,
        ),
        WebSiteWidget(
          wbVideos: agentsController.wbVideos,
          wbBlog: agentsController.wbBlog,
          wbphotos: agentsController.wbphotos,
        ),
      ],
    );
  }
}
