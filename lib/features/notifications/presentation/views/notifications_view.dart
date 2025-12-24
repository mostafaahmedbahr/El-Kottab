

import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/notifications/presentation/views/widgets/notification_list.dart';

import '../../../../core/app_services/remote_services/service_locator.dart';
import '../../../../main_imports.dart';
import '../../data/repos/notifications_repo_imple.dart';
import '../view_model/notifications_cubit.dart';
import '../view_model/notifications_states.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsCubit , NotificationsStates>(
      listener: (context,state){},
      builder:  (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text(LangKeys.notifications.tr()),
            actions: [
             if(context.read<NotificationsCubit>().notificationsModel!=null && context.read<NotificationsCubit>().notificationsModel!.data!.isNotEmpty)
              TextButton(
                onPressed: (){
                 // context.read<NotificationsCubit>().deleteNotification(notifyId: "all");
                },
                  child: Text(LangKeys.deleteAll.tr(),style: TextStyle(
                    color: AppColors.errorDark,
                  ),),
              ),
            ],
          ),
          body:  NotificationList( ),
        );
      },

    );
  }
}