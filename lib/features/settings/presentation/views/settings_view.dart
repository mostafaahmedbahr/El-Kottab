import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/core/extensions/lang.dart';
import 'package:el_kottab/features/settings/presentation/views/widgets/show_delete_account_dialog.dart';
import 'package:el_kottab/main_imports.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.settings.tr()),
      ),
      body: Padding(
        padding:   EdgeInsets.all(12.0.r),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                showDeleteAccountDialog(context);
              },
              child: Container(
                padding: EdgeInsets.all(12.r),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.white,
                    border: Border.all(
                        color: AppColors.errorDark
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6.r),
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: AppColors.errorLight.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(SvgImages.logout),
                        ),
                        Gap(8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(LangKeys.deleteAccount.tr(),style: AppStyles.black16SemiBold.copyWith(
                                color: AppColors.errorLight
                            ),),
                          ],
                        ),
                      ],
                    ),
                    IconButton(onPressed: (){
                      showDeleteAccountDialog(context);
                    }, icon: SvgPicture.asset(
                      context.isArabic? SvgImages.arrowLeft:
                      SvgImages.arrowRight,colorFilter: ColorFilter.mode(AppColors.errorLight, BlendMode.srcIn),),),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
