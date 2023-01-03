import 'package:drone/core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:repo_repository/repo_repository.dart';

extension DroneStatusX on DroneStatus {
  Color get color {
    switch (this) {
      case DroneStatus.running:
        return Colors.yellow.shade700;
      case DroneStatus.success:
        return const Color(0xff42ab45);
      case DroneStatus.failure:
      case DroneStatus.error:
      case DroneStatus.killed:
      case DroneStatus.declined:
        return const Color(0xffe43326);
      case DroneStatus.pending:
        return const Color.fromARGB(255, 161, 161, 161);
      case DroneStatus.blocked:
      case DroneStatus.skipped:
      case DroneStatus.waitingOnDependencies:
      case DroneStatus.unknown:
        return const Color.fromARGB(255, 163, 163, 163);
    }
  }

  Widget get toIcon {
    switch (this) {
      case DroneStatus.running:
        return RotationSyncIcon(color: color);
      case DroneStatus.success:
        return Icon(
          Ionicons.checkmark_circle,
          color: color,
        );
      case DroneStatus.failure:
      case DroneStatus.error:
      case DroneStatus.killed:
      case DroneStatus.declined:
        return Icon(
          Ionicons.close_circle,
          color: color,
        );
      case DroneStatus.pending:
        return RotationSyncIcon(color: color);
      case DroneStatus.blocked:
      case DroneStatus.skipped:
      case DroneStatus.waitingOnDependencies:
      case DroneStatus.unknown:
        return Icon(
          Ionicons.remove_circle,
          color: color,
        );
    }
  }
}


// enum StepStatus {
//   error,
//   running,
//   pending,
//   success,
//   declined,
//   failure,
//   killed,
//   skipped,
//   waiting,
//   blocked,
//   unknown
// }
