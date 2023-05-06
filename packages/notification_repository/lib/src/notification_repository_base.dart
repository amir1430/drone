import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:local_data_source/local_data_sorce.dart';

import 'package:drone_dart/drone_dart.dart';
import 'package:rxdart/rxdart.dart';

typedef Token = String;

class NotificationRepository with _NotificationRepositoryMixin {
  NotificationRepository({
    required UserLocalDataSource userLocalDataSource,
    AwesomeNotifications? awesomeNotifications,
  }) : _awesomeNotifications = awesomeNotifications ?? AwesomeNotifications() {
    droneEventController = BehaviorSubject<DroneEvent>();

    _usersOpSubscription =
        userLocalDataSource.userOperationsStream.listen((event) async {
      switch (event.operation) {
        case Operation.initial:
          if (event.user.isNotificationEnable) {
            startSubscription(user: event.user);
          }
          break;
        case Operation.add:
          if (event.user.isNotificationEnable &&
              !isTokenInSubscriptions(token: event.user.token)) {
            startSubscription(user: event.user);
          }
          break;
        case Operation.delete:
          cancelSubscription(token: event.user.token);
          break;
        case Operation.update:
          if (event.oldUser!.token != event.user.token ||
              event.oldUser!.server != event.user.server) {
            cancelSubscription(token: event.oldUser!.token);
          }
          if (event.user.isNotificationEnable) {
            if (!isTokenInSubscriptions(token: event.user.token)) {
              startSubscription(user: event.user);
            }
          } else {
            if (isTokenInSubscriptions(token: event.user.token)) {
              cancelSubscription(token: event.user.token);
            }
          }
          break;
      }
    });
  }

  final AwesomeNotifications _awesomeNotifications;

  late final StreamSubscription<UserLocalDataSourceEvent> _usersOpSubscription;

  static final StreamController<ReceivedAction> _receivedActionController =
      BehaviorSubject<ReceivedAction>();

  Stream<DroneEvent> get droneEventStream => droneEventController.stream;

  Stream<ReceivedAction> get receivedActionStream =>
      _receivedActionController.stream;

  Future<bool> createNotification({
    required NotificationContent content,
    NotificationSchedule? schedule,
    List<NotificationActionButton>? actionButtons,
  }) async {
    return await _awesomeNotifications.createNotification(
      content: content,
      actionButtons: actionButtons,
      schedule: schedule,
    );
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    _receivedActionController.sink.add(receivedAction);
  }

  Future<void> close() async {
    await disposeSubscriptions();

    await _usersOpSubscription.cancel();
    await _receivedActionController.close();
    await _awesomeNotifications.dispose();
  }
}

mixin _NotificationRepositoryMixin {
  late final StreamController<DroneEvent> droneEventController;
  final Map<Token, StreamSubscription<DroneEvent>> subscriptions = {};

  Future<void> startSubscription({
    required User user,
  }) async {
    subscriptions[user.token] = user.client.stream.listen((event) {
      droneEventController.sink.add(event);
    });
  }

  Future<void> cancelSubscription({required Token token}) async {
    if (isTokenInSubscriptions(token: token)) {
      await subscriptions[token]?.cancel();
      subscriptions.removeWhere((key, _) => key == token);
    }
  }

  bool isTokenInSubscriptions({required Token token}) {
    return subscriptions.containsKey(token);
  }

  Future<void> disposeSubscriptions() async {
    await subscriptions.cancelAll();
    await droneEventController.close();
  }
}

extension on Map<dynamic, StreamSubscription> {
  Future<void> cancelAll() =>
      Future.wait([...entries.map((e) async => await e.value.cancel())]);
}
