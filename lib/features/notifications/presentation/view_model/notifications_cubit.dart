import '../../../../main_imports.dart';
import '../../data/models/notifications_count_model.dart';
import '../../data/models/notifications_model.dart';
import '../../data/repos/notifications_repo.dart';
import 'notifications_states.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit(this.notificationsRepo) : super(NotificationsInitState());
  NotificationsRepo? notificationsRepo;

  NotificationsModel? notificationsModel;
  Future<void> getAllNotifications()
  async {
    emit(GetAllNotificationsLoadingState());
    var result = await notificationsRepo!.getAllNotifications();
    return result.fold((failure) {
      emit(GetAllNotificationsErrorState(failure.errMessage));
    }, (data) async {
      notificationsModel = data;
      emit(GetAllNotificationsSuccessState(data));
    });
  }

  // ReadAllNotificationsModel? readAllNotificationsModel;
  // Future<void> readAllNotifications()
  // async {
  //   emit(ReadAllNotificationsLoadingState());
  //   var result = await notificationsRepo!.readAllNotifications();
  //   return result.fold((failure) {
  //     emit(ReadAllNotificationsErrorState(failure.errMessage));
  //   }, (data) async {
  //     if(data.code==200){
  //       readAllNotificationsModel = data;
  //       emit(ReadAllNotificationsSuccessState(data));
  //       notificationsCount();
  //     }
  //     else{
  //       final errorMessage = data.message?.toString() ?? 'Read All Notifications failed with code ${data.code}';
  //       emit(ReadAllNotificationsErrorState(errorMessage));
  //     }
  //   });
  // }
  //
  //
  NotificationsCountModel? notificationsCountModel;
  Future<void> getNotificationsCount()
  async {
    emit(NotificationsCountLoadingState());
    var result = await notificationsRepo!.getNotificationsCount();
    return result.fold((failure) {
      emit(NotificationsCountErrorState(failure.errMessage));
    }, (data) async {
        notificationsCountModel = data;
        emit(NotificationsCountSuccessState(data));
    });
  }


  // DeleteNotificationModel? deleteNotificationModel;
  // Future<void> deleteNotification({required String notifyId })
  // async {
  //   emit(DeleteNotificationsLoadingState());
  //   var result = await notificationsRepo!.deleteNotification(notifyId: notifyId);
  //   return result.fold((failure) {
  //     emit(DeleteNotificationsErrorState(failure.errMessage));
  //   }, (data) async {
  //     if(data.code==200){
  //       deleteNotificationModel = data;
  //       emit(DeleteNotificationsSuccessState(data));
  //     }
  //     else{
  //       final errorMessage = data.message?.toString() ?? 'Delete Notifications failed with code ${data.code}';
  //       emit(DeleteNotificationsErrorState(errorMessage));
  //     }
  //   });
  // }

}