import 'package:dartz/dartz.dart';

 import '../../../../core/app_services/remote_services/api_service.dart';
import '../../../../core/app_services/remote_services/end_points.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../models/delete_notification_model.dart';
import '../models/notifications_count_model.dart';
import '../models/notifications_model.dart';
import '../models/read_all_notifications_model.dart';
import 'notifications_repo.dart';



class NotificationsRepoImpl implements NotificationsRepo {
  final ApiService? apiService;

  NotificationsRepoImpl(this.apiService);


  @override
  Future<Either<Failure, NotificationsModel>> getAllNotifications() async{
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.notifications,
      );
      NotificationsModel result = NotificationsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }


  @override
  Future<Either<Failure, ReadAllNotificationsModel>> readAllNotifications({required int notifyId}) async{
    try {
      var response = await apiService!.getData(
        endPoint: "${EndPoints.notifications}/$notifyId",
      );
      ReadAllNotificationsModel result = ReadAllNotificationsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, NotificationsCountModel>> getNotificationsCount() async{
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.countUnreadNotification,
      );
      NotificationsCountModel result = NotificationsCountModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  // @override
  // Future<Either<Failure, DeleteNotificationModel>> deleteNotification({required String notifyId }) async{
  //   try {
  //     var response = await apiService!.deleteData(
  //       endPoint: "${EndPoints.notifications}/$notifyId",
  //     );
  //     DeleteNotificationModel result = DeleteNotificationModel.fromJson(response.data);
  //     return right(result);
  //   } catch (e) {
  //     return left(handleError(e));
  //   }
  // }

}

