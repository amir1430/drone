import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    log('✅ Create Bloc --> ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('🔁 Change Bloc type --> ${change.runtimeType}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('🔴 Error Bloc --> ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    log('❌ Close Bloc --> ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    log('🔗 Event Bloc --> $event');
    super.onEvent(bloc, event);
  }

  // @override
  // void onTransition(
  //   Bloc<dynamic, dynamic> bloc,
  //   Transition<dynamic, dynamic> transition,
  // ) {
  //   log('Transition Bloc --> ${transition.runtimeType}');
  //   super.onTransition(bloc, transition);
  // }
}
