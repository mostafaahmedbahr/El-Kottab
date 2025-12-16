import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../register/presentation/view_model/register_cubit.dart';
import '../../../../register/presentation/view_model/register_states.dart';

class CompleteRegisterForm extends StatelessWidget {
  const CompleteRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterStates>(
      builder: (context,state){
        var registerCubit = context.read<RegisterCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.name.tr(),style: AppStyles.black14Medium,),
            Gap(8.h),
            CustomTextFormField(
              //controller: loginCubit.emailCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.name.tr(),
              prefixIcon: Padding(
                padding:   EdgeInsets.all(10.0.r),
                child: SvgPicture.asset(SvgImages.profile,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),),
              ),
              validator: (value)=> AppValidators.emailValidator(value),
            ),
            Gap(20.h),
            Text(LangKeys.gender.tr(),style: AppStyles.black14Medium,),
            Gap(8.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48.h,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: registerCubit.gender=="female"  ?  AppColors.darkOlive.withValues(alpha: 0.2):AppColors.white,
                        border: Border.all(
                            color:registerCubit.gender=="female"  ?  AppColors.darkOlive.withValues(alpha: 0.2): AppColors.gray
                        )
                    ),
                    child: InkWell(
                      onTap: (){
                        registerCubit.selectGender("female");
                        print(registerCubit.gender);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(SvgImages.woman,height: 25.h,width: 25.w,fit: BoxFit.cover,),
                          Gap(8.w),
                          Text(LangKeys.female.tr()),
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: Container(
                    height: 48.h,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color:registerCubit.gender=="male"  ?  AppColors.darkOlive.withValues(alpha: 0.2): AppColors.white,
                        border: Border.all(
                            color:registerCubit.gender=="male"  ?  AppColors.darkOlive.withValues(alpha: 0.2): AppColors.gray
                        )
                    ),
                    child: InkWell(
                      onTap: (){
                        registerCubit.selectGender("male");
                        print(registerCubit.gender);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(SvgImages.man,height: 25.h,width: 25.w,fit: BoxFit.cover,),
                          Gap(8.w),
                          Text(LangKeys.male.tr()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Text(LangKeys.password.tr(),style: AppStyles.black14Medium,),
            Gap(8.h),
            CustomTextFormField(
              controller: registerCubit.passCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.password.tr(),
              prefixIcon: Padding(
                padding:   EdgeInsets.all(10.0.r),
                child: SvgPicture.asset(SvgImages.lock,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),),
              ),
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: SvgPicture.asset(registerCubit.isVisible ?
                SvgImages.eye : SvgImages.openEye ,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),),
                onPressed: registerCubit.changeSuffixIcon,
              ),
              obscureText: registerCubit.isVisible,
              validator: (String? value) => AppValidators.passwordValidator(value),
            ),
            Gap(20.h),
            Text(LangKeys.confirmPassword.tr(),style: AppStyles.black14Medium,),
            Gap(8.h),
            CustomTextFormField(
              controller: registerCubit.confirmPassCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.confirmPassword.tr(),
              prefixIcon: Padding(
                padding:   EdgeInsets.all(10.0.r),
                child: SvgPicture.asset(SvgImages.lock,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),),
              ),
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: SvgPicture.asset(registerCubit.isVisible2 ?
                SvgImages.eye : SvgImages.openEye ,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),),
                onPressed: registerCubit.changeSuffixIcon2,
              ),
              obscureText: registerCubit.isVisible2,
              validator: (String? value) => AppValidators.passwordValidator(value),
            ),
          ],
        );
      },

    );
  }
}
