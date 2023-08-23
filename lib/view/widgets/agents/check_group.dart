 import '../../../libraries.dart';

// ignore: must_be_immutable
class CheckGroup extends StatelessWidget {
  const CheckGroup({
    super.key,
    required this.values,
    required this.groupController,
  });
  final List<String> values;
  final GroupController groupController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SimpleGroupedChips<String>(
          controller: groupController,
          values: values,
          itemTitle: values,
          chipGroupStyle: ChipGroupStyle.minimize(
            backgroundColorItem: AppColorManger.primary,
            itemTitleStyle: Theme.of(context)
            .textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}
