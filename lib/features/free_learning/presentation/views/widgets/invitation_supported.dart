import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';

class InvitationSupported extends StatelessWidget {
  const InvitationSupported({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LangKeys.thisInvitationIsSupportedBy.tr()),
              Text(LangKeys.theCompanyName.tr(),style: AppStyles.primary16SemiBold,),
            ],
          ),
          Image.asset(PngImages.logo,height: 80.h,width: 80.w,fit: BoxFit.cover,),
        ],
      ),
    );
  }
}
