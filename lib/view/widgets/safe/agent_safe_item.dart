import 'package:rbs/libraries.dart';

class AgentSafeItem extends StatelessWidget {
  const AgentSafeItem({
    super.key,
    this.agent,
    this.onTap,
    required this.isHeader,
  });
  final Agent? agent;
  final bool isHeader;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    if (isHeader) {
      return const Center(
        child: Row(
          children: [
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 200,
              text: AppStrings.name,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 200,
              text: AppStrings.agentAcc,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 200,
              text: AppStrings.mange,
            ),
          ],
        ),
      );
    } else {
      return Row(
        children: [
          MyCielFixed(
            isBack: false,
            isHeader: false,
            width: 200,
            text: agent!.name,
          ),
          MyCielFixed(
            isBack: false,
            isHeader: false,
            width: 200,
            text: agent!.account,
          ),
          SizedBox(
            width: 200,
            child: MyButton(text: AppStrings.mange, onPressed: onTap),
          ),
          // MyCielFixed(
          //   isBack: false,
          //   isHeader: false,
          //   text: '',
          //   width: 200,
          //   child: MyButton(
          //     text: AppStrings.mange,
          //     onPressed: onTap,
          //   ),
          // ),
        ],
      );
    }
  }
}
