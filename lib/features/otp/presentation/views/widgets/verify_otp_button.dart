
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../view_model/otp_cubit.dart';
import '../../view_model/otp_states.dart';

class VerifyOtpButton extends StatelessWidget {
  final TextEditingController controller;
  final String goToLayoutOrResetPassword;
  const VerifyOtpButton({super.key, required this.controller, required this.goToLayoutOrResetPassword});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpStates>(
      listener: (context, state) {
        // if (state is VerifyOtpSuccessState) {
        //     // AppNav.customNavigator(
        //     //   context: context,
        //     //   screen:goToLayoutOrResetPassword=="Layout" ? const LayoutView() : ResetPasswordView(),
        //     //   finish:goToLayoutOrResetPassword=="Layout" ? true : false,
        //     // );
        //   NewToast.showNewSuccessToast(
        //     msg: state.verifyOtpModel.message.toString(),
        //     context: context,
        //   );
        //     context.read<AuthCubit>().loginWithToken(state.verifyOtpModel.data!.token.toString());
        // }
        // if (state is VerifyOtpErrorState) {
        //   NewToast.showNewErrorToast(
        //     msg: state.error.toString(),
        //     context: context,
        //   );
        // }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! VerifyOtpLoadingState,
          fallback: (context) => const CustomLoading(),
          builder: (context) {
            return CustomButton(
              borderColor: AppColors.white,
              btnText:
                LangKeys.continuee.tr(),

              onPressed: () {
                if (controller.text.length == 6) {
                  // context.read<OtpCubit>().verifyOtp(
                  //   otpCode: controller.text,
                  // );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(LangKeys.pleaseEnterValidOtp.tr())),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
