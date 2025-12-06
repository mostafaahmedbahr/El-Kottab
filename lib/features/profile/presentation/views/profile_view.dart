import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/profile/presentation/views/widgets/profile_info_data.dart';
import 'package:el_kottab/features/profile/presentation/views/widgets/profile_list_items.dart';

import '../../../../main_imports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(12.0.r),
        child: ListView(
          children: [
            ProfileInfoData(),
            Gap(16.h),
            ProfileListItems(),
            // Gap(16.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     IconButton(onPressed: (){}, icon: SvgPicture.asset(SvgImages.facebook)),
            //     IconButton(onPressed: (){}, icon: SvgPicture.asset(SvgImages.linkedin)),
            //     IconButton(onPressed: (){}, icon: SvgPicture.asset(SvgImages.twitter)),
            //   ],
            // ),
            // Gap(16.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //
            //     Text(LangKeys.appVersion.tr(),),
            //     Gap(6.w),
            //     Text("1.0.0",style: AppStyles.primary16SemiBold,),
            //   ],
            // ),
          ],
        ),
      )),
    );
  }
}