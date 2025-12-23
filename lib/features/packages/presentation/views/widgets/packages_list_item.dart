import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/packages/data/models/packages_model.dart';
import 'package:el_kottab/main_imports.dart';

class PackagesListItem extends StatelessWidget {
  const PackagesListItem({super.key,   this.package});
  final Data? package;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.grayLightest,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(SvgImages.packageTest,height: 60.h,width: 60.w,),
          Column(
            children: [
              Row(
                children: [
                  Text("${package?.minutes}",style: AppStyles.black20Bold,),
                  Gap(6.w),
                  Text(LangKeys.minute.tr()),
                ],
              ),
              Gap(8.h),
              Row(
                children: [
                  Text(LangKeys.validFor.tr()),
                  Gap(4.w),
                  Text("${package?.validDays}",style: AppStyles.black16SemiBold,),
                  Gap(4.w),
                  Text(LangKeys.day.tr()),
                ],
              ),
              Gap(8.h),
              SizedBox(
                height: 50.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 200.w,
                          height: 40.h,
                          padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 4.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppColors.darkOlive,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("${package?.priceInDolar}" , style: AppStyles.white12SemiBold,),
                                  Gap(4.w),
                                  Text("SAR",style: AppStyles.white8SemiBold,)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("${package?.priceInDolar}" , style: AppStyles.white12SemiBold,),
                                  Gap(4.w),
                                  Text("SAR",style: AppStyles.white8SemiBold,)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.lightGold
                      ),
                      child: Row(
                        children: [
                          Text(LangKeys.discount.tr()),
                          Gap(4.w),
                          Text("30%"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
