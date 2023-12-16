import 'package:intl/intl.dart';
import '../../../libraries.dart';
import 'table/ds_column.dart';
import 'table/fb_column.dart';
import 'table/ins_column.dart';
import 'table/wb_column.dart';
import 'table/yt_column.dart';

class AgentProfile extends StatelessWidget {
  AgentProfile({super.key, required this.agent});
  final Agent agent;
  final formatter = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.h01),
      color: AppColorManger.primary,
      child: Column(
        children: [
          Row(
            children: [
              MyImage(
                url: '${Api.agentsViewImage}/${agent.image}',
                height: AppSizes.h1,
                width: AppSizes.h1,
              ),
              const Spacer(),
              Text(
                '${AppStrings.renewalDate} ${formatter.format(agent.renewalDate)}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColorManger.white,
                    ),
              )
            ],
          ),
          Text(
            AppStrings.agentsMap,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColorManger.white,
                ),
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          ScrolableWithChild(
            child: Row(
              children: [
                FBAgentColumn(agent: agent),
                InsAgentColumn(agent: agent),
                DsAgentColumn(agent: agent),
                WbAgentColumn(agent: agent),
                YTAgentColumn(agent: agent),
              ],
            ),
          ),

          // Expanded(
          //   child: ListView(

          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       FBAgentColumn(agent: agent),
          //       InsAgentColumn(agent: agent),
          //       DsAgentColumn(agent: agent),
          //       WbAgentColumn(agent: agent),
          //       YTAgentColumn(agent: agent),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
