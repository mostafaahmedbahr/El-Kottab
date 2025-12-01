import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';


class RegisterEmailForm extends StatelessWidget {
  const RegisterEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.email.tr()),
        Gap(12.h),
        /// Email
        CustomTextFormField(
         // controller: loginCubit.emailCon,
          keyboardType: TextInputType.visiblePassword,
          hintText: LangKeys.email.tr(),
          prefixIcon: Padding(
            padding:   EdgeInsets.all(10.0.r),
            child: SvgPicture.asset(SvgImages.email,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),),
          ),
          validator: (value)=> AppValidators.emailValidator(value),
        ),
      ],
    );
  }
}
