


import '../../../../../core/shared_widgets/custom_text.dart';
import '../../../../../main_importants.dart';

class ResetPasswordTexts extends StatelessWidget {
  const ResetPasswordTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.enterTheNewPassword,
          fontSize: 20,
          textColor: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
        verticalSpace(10),
        CustomText(
          text: AppStrings.enterTheNewPasswordMsg,
          fontSize: 12,
          textColor: AppColors.whiteColor,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
