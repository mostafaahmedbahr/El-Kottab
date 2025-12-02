import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/core/utils/app_nav.dart';
import 'package:el_kottab/features/layout/presentation/views/layout_view.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../core/utils/app_images/jpg_images.dart';

class CreateAccountDoneView extends StatelessWidget {
  const CreateAccountDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          SizedBox.shrink(),
          Column(
            children: [
              Image.asset(JpgImages.checkMark,height: 150.h,width: 150.w),
              Gap(16.h),
              Text(LangKeys.successfullyCreateAnAccount.tr(),style: AppStyles.black20Bold,),
            ],
          ),
          CustomButton(
            btnText: LangKeys.goToHome.tr(),
              onPressed: (){
              AppNav.customNavigator(context: context, screen: LayoutView(),finish: true);
              },
          ),
        ],),
      )),
    );
  }
}
