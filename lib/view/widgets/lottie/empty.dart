import '../../../libraries.dart';

class MyLottieEmpty extends StatelessWidget {
  const MyLottieEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/empty.json',
        width: AppSizes.w3,
        height: AppSizes.h3,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
