import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/free_learning/presentation/views/widgets/invitation_supported.dart';
import 'package:el_kottab/features/free_learning/presentation/views/widgets/main_info.dart';
import 'package:el_kottab/main_imports.dart';

class FreeLearningView extends StatelessWidget {
  const FreeLearningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.aLFatihahInitiative.tr()),
      ),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            MainInfo(),
            Gap(24.h),
            InvitationSupported(),
            Spacer(),
            CustomButton(
                btnText: LangKeys.startFreeLearning.tr(),
                onPressed: (){}),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
