import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/shared_cubits/auth_cubit/auth_cubit.dart';
import '../../../../../main_imports.dart';
import '../../../../layout/presentation/views/layout_view.dart';
import '../../view_model/otp_cubit.dart';
import '../../view_model/otp_states.dart';

class VerifyOtpButton extends StatelessWidget {
  final TextEditingController controller;
  final String goToLayoutOrResetPassword;
  final String email;

  const VerifyOtpButton({
    super.key,
    required this.controller,
    required this.goToLayoutOrResetPassword,
    required this.email
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpStates>(
      listenWhen: (previous, current) {
        // استمع فقط للحالات المطلوبة
        return current is VerifyOtpSuccessState ||
            current is VerifyOtpErrorState;
      },
      listener: (context, state) {
        if (state is VerifyOtpSuccessState) {
          AppNav.customNavigator(
            context: context,
            screen: const LayoutView(),
            finish: goToLayoutOrResetPassword == "Layout",
          );
          Toast.showSuccessToast(
            msg: state.verifyOtpModel.message?.toString() ?? "",
            context: context,
          );
          context.read<AuthCubit>().loginWithToken(state.verifyOtpModel.data!.token.toString());
        }
        if (state is VerifyOtpErrorState) {
          Toast.showErrorToast(
            msg: state.error.toString(),
            context: context,
          );
        }
      },
      buildWhen: (previous, current) {
        // اعمل build فقط للحالات المتعلقة بـ verify
        return current is VerifyOtpLoadingState ||
            current is! VerifyOtpLoadingState;
      },
      builder: (context, state) {
        final isLoading = state is VerifyOtpLoadingState;

        return isLoading
            ? const CustomLoading()
            : CustomButton(
          borderColor: AppColors.white,
          btnText: LangKeys.continuee.tr(),
          onPressed: () {
            if (controller.text.length == 6) {
              context.read<OtpCubit>().verifyOtp(
                otpCode: controller.text,
                email: email,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(LangKeys.pleaseEnterValidOtp.tr())),
              );
            }
          },
        );
      },
    );
  }
}
