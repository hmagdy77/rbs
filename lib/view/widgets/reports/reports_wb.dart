 import '../../../libraries.dart';

class ReportsWebSite extends StatelessWidget {
  const ReportsWebSite({
    super.key,
    required this.agent,
    required this.cubit,
  });

  final Agent agent;
  final ReportsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return agent.wbBlog == '0' && agent.wbPhotos == '0' && agent.wbVideos == '0'
        ? const SizedBox()
        : MyExpandapleItem(
            label: AppStrings.website,
            child: Column(
              children: [
                agent.wbBlog == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.wbBlog,
                        sufIcon: const Icon(FontAwesomeIcons.internetExplorer),
                        label: AppStrings.wbBlog,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.wbPhotos == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.wbphotos,
                        sufIcon: const Icon(FontAwesomeIcons.internetExplorer),
                        label: AppStrings.wbphotos,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.wbVideos == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.wbVideos,
                        sufIcon: const Icon(FontAwesomeIcons.internetExplorer),
                        label: AppStrings.wbVideos,
                      ),
              ],
            ),
          );
  }
}
