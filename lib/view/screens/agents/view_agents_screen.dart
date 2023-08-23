// import '../../../bloc/agents/agents_cubit.dart';
// import '../../../libraries.dart';

// class AgentsViewScreen extends StatelessWidget {
//   const AgentsViewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(AppStrings.agentsEdit),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: BlocBuilder<AgentsCubit, AgentsState>(
//           builder: (context, state) {
//             var cubit = context.read<AgentsCubit>();
//             if (state is StateLoading) {
//               return const Center(
//                 child: MyLottieLoading(),
//               );
//             } else {
//               return GridView.builder(
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 200,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 10,
//                 ),
//                 itemBuilder: (context, index) {
//                   return AgentItem(
//                     agent: cubit.allAgents[index],
//                     ontap: () {
//                       cubit.prepareTextFields(agent: cubit.allAgents[index]);
//                       Navigator.pushNamed(context, AppRoutes.agentsEditScreen,
//                           arguments: cubit.allAgents[index]);
//                     },
//                     onChanged: (bool) {},
//                     value: true,
//                   );
//                 },
//                 itemCount: cubit.allAgents.length,
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
