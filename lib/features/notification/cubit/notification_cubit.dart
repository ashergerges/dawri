import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/notification/data/models/notification_group_model.dart';
import 'package:dawri/features/notification/data/repositories/interfaces/i_notification_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() :
        _repository=getIt<INotificationRepository>(),
        super( NotificationState(refreshController:RefreshController() ));
  final INotificationRepository _repository;
  Future<void> notifications({bool isRefresh=false}) async {
    if(state.notificationGroup.isEmpty||isRefresh)emit(state.copyWith(currState:Loading(),));
    var notification = await _repository.notification();
    if (notification.isError) {
      MessageService.showToast(
        msg: notification.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),notificationGroup:notification.asValue?.value??[] ));
  }

}
