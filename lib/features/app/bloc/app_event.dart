part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.started() = _Started;
  const factory AppEvent.createNotification({
    required NotificationContent content,
    NotificationSchedule? schedule,
    List<NotificationActionButton>? actionButtons,
  }) = _CreateNotification;

  const factory AppEvent.notificationClicked({
    required ReceivedAction action,
  }) = _NotificationClicked;
}
