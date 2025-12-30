import 'package:el_kottab/features/notifications/presentation/views/notifications_view.dart';
import 'package:el_kottab/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:el_kottab/features/profile/presentation/view_model/profile_states.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/shared_cubits/auth_cubit/auth_cubit.dart';
import '../../../../../core/utils/app_consts/storage_keys.dart';
import '../../../../../main_imports.dart';
import '../../../../notifications/presentation/view_model/notifications_cubit.dart';
import '../../../../notifications/presentation/view_model/notifications_states.dart';
import 'package:badges/badges.dart' as badges;
class ProfileNameAndNotificationIcon extends StatefulWidget {
  const ProfileNameAndNotificationIcon({super.key});

  @override
  State<ProfileNameAndNotificationIcon> createState() => _ProfileNameAndNotificationIconState();
}

class _ProfileNameAndNotificationIconState extends State<ProfileNameAndNotificationIcon> {
  @override
  void initState() {
    final authCubit = context.read<AuthCubit>();
    if (!authCubit.isGuest) {
      if(context.read<ProfileCubit>().profileModel == null){
        context.read<ProfileCubit>().getProfileData();
      }
      context.read<NotificationsCubit>().getNotificationsCount();
    }

    super.initState();
  }
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
                      profile?.data?.name ?? " ",
                      style: AppStyles.black16SemiBold,
                    ),
                  ),
                ],
              ),
              BlocBuilder<NotificationsCubit , NotificationsStates>(
                buildWhen:  (previous, current) {
                  return current is NotificationsCountLoadingState
                      || current is NotificationsCountSuccessState
                      || current is NotificationsCountErrorState;
                },
               builder: (context,state){
                 final int count = int.tryParse(
                   context.read<NotificationsCubit>().notificationsCountModel?.data?.toString() ?? "0",
                 ) ?? 0;
                  return InkWell(
                    onTap: () {
                      AppNav.customNavigator(
                        context: context,
                        screen: const NotificationView(),
                      );
                    },
                    child: badges.Badge(
                      position: badges.BadgePosition.topEnd(top: 5, end: 10),
                      showBadge: count > 0,
                      badgeContent: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(scale: animation, child: child),
                        child: Text(
                          "$count",
                          key: ValueKey<int>(count),
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      child: SvgPicture.asset(
                        SvgImages.notify,
                        colorFilter: const ColorFilter.mode(
                          AppColors.darkOlive,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  );
               },
              ),
            ],
          ),
        );
      },
    );
  }
}
