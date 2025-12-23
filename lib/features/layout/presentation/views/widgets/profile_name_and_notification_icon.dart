import 'package:el_kottab/features/notifications/presentation/views/notifications_view.dart';
import 'package:el_kottab/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:el_kottab/features/profile/presentation/view_model/profile_states.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../main_imports.dart';

class ProfileNameAndNotificationIcon extends StatelessWidget {
  const ProfileNameAndNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        final profileCubit = context.read<ProfileCubit>();
        final profile = profileCubit.profileModel;

        return Skeletonizer(
          enabled: profile == null || state is GetProfileDataLoadingState,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomNetWorkImage(
                    raduis: 50,
                    imageUrl: profile?.data?.image ?? "",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  const Gap(6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      profile?.data?.name ?? " ", // 👈 بدون !
                      style: AppStyles.black16SemiBold,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  AppNav.customNavigator(
                    context: context,
                    screen: const NotificationView(),
                  );
                },
                child: SvgPicture.asset(
                  SvgImages.notify,
                  colorFilter: const ColorFilter.mode(
                    AppColors.darkOlive,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
