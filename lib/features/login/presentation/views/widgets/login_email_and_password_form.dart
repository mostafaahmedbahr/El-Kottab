
import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/core/utils/app_validator/app_validator.dart';

 import '../../../../../main_imports.dart';
import '../../view_model/login_cubit.dart';
import '../../view_model/login_states.dart';

class LoginEmailAndPasswordForm extends StatelessWidget {
  const LoginEmailAndPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit , LoginStates>(
      buildWhen: (previous, current){
        return current is ChangePasswordVisibleState;
      },
      builder: (context,state){
        var loginCubit = context.read<LoginCubit>();
        return Column(
          children: [
            /// Email
            CustomTextFormField(
              controller: loginCubit.emailCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.email.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.email,),
              ),
              validator: (value)=> AppValidators.emailValidator(value),
            ),
            Gap(20.h),
            /// Password Field
            CustomTextFormField(
              controller: loginCubit.passwordCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.password.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock,),
              ),
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: SvgPicture.asset(loginCubit.isPasswordVisible ?
                SvgImages.eye : SvgImages.openEye),
                onPressed: loginCubit.changePasswordVisible,
              ),
              obscureText: loginCubit.isPasswordVisible,
              validator: (String? value) => AppValidators.passwordValidator(value),
            ),
          ],
        );
      },

    );
  }
}
