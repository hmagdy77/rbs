import '../../../libraries.dart';
import '../statics/table_ciel.dart';

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
      return Center(
        child: Row(
          children: [
            MyCiel(
              isBack: false,
              isHeader: true,
              width: 2,
              style: context.textTheme.displaySmall,
              text: AppStrings.name,
            ),
            MyCiel(
              isBack: false,
              isHeader: true,
              width: 2,
              style: context.textTheme.displaySmall,
              text: AppStrings.agentAcc,
            ),
            MyCiel(
              isBack: false,
              isHeader: true,
              width: 2,
              style: context.textTheme.displaySmall,
              text: AppStrings.mange,
            ),
          ],
        ),
      );
    } else {
      return Row(
        children: [
          MyCiel(
            isBack: false,
            isHeader: false,
            width: 2,
            style: context.textTheme.displaySmall,
            text: agent!.name,
          ),
          MyCiel(
            isBack: false,
            isHeader: false,
            width: 2,
            style: context.textTheme.displaySmall,
            text: agent!.account,
          ),
          Expanded(
            flex: 2,
            child: MyButton(text: AppStrings.mange, onPressed: onTap),
          ),
          // MyCiel(
          //   isBack: false,
          //   isHeader: false,
          //   text: '',
          //   width: 2, style: context.textTheme.displaySmall,
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
