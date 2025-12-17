


import 'package:el_kottab/core/utils/app_nav.dart';
import 'package:el_kottab/features/notifications/presentation/views/notifications_view.dart';
import 'package:el_kottab/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:el_kottab/features/profile/presentation/view_model/profile_states.dart';

import '../../../../../core/shared_widgets/custom_cached_network_image.dart';
import '../../../../../main_imports.dart';

class ProfileNameAndNotificationIcon extends StatelessWidget {
  const ProfileNameAndNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return BlocBuilder<ProfileCubit , ProfileStates>(
      builder: (context,state){
        var profileCubit = context.read<ProfileCubit>();
        return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomNetWorkImage(
                  raduis: 50,
                  imageUrl: "${profileCubit.profileModel?.data?.image ?? ""}",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Gap(6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        isArabic ? "اهلا مصطفي بحر":   "Hi, Mostafa Bahr",
                        style: AppStyles.black16SemiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
                onTap: (){
                  AppNav.customNavigator(context: context, screen: NotificationView());
                },
                child: SvgPicture.asset(SvgImages.notify,colorFilter: ColorFilter.mode(AppColors.darkOlive, BlendMode.srcIn),)),
          ],
        );
      },

    );
  }
}