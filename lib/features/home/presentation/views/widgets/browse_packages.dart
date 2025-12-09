import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/core/utils/app_nav.dart';
import 'package:el_kottab/features/packages/presentation/views/packages_view.dart';
import 'package:el_kottab/main_imports.dart';

class BrowsePackages extends StatelessWidget {
  const BrowsePackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LangKeys.packages.tr(), style: AppStyles.black16SemiBold.copyWith(
            fontSize: 18.sp,
          ),),
          Gap(16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 12.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.cream,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.doNotHaveAnActivatedPackage.tr(),
                      style: AppStyles.black14Medium,),
                      Gap(12.h),
                      Text(LangKeys.browseAvailablePackages.tr(),
                      style: AppStyles.gray10Medium,),

                    ],
                  ),
                ),
                Gap(8.w),
                CustomButton(
                    width: 150.w,
                    child: Text(LangKeys.browsePackages.tr(),
                      style: TextStyle(
                          color: AppColors.white
                      ),),
                    onPressed: (){
                      AppNav.customNavigator(context: context, screen: PackagesView());
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
