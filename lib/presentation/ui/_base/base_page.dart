import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stream_disposable/stream_disposable.dart';
import 'package:vost/presentation/ui/_base/base_bloc.dart';
import 'package:vost/presentation/utils/misc.dart';

abstract class BasePage<Bloc extends BaseBloc> extends StatefulWidget {
  final Bloc bloc;

  bool get showPoorConnection => true;

  BasePage({@required this.bloc, Key key}) : super(key: key);
}

abstract class BaseState<T extends BasePage> extends State<T> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  StreamDisposable disposable = StreamDisposable();

  /// We parse here messages defined in [error_messages.dart]
  String getMessage(String error);

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    widget.bloc.errorStream
        .transform(new ThrottleStreamTransformer(
            (_) => TimerStream(true, const Duration(seconds: 2))))
        .listen((error) =>
            showErrorSnackbar(getMessage(error), scaffoldKey.currentState));
  }

  @override
  @mustCallSuper
  void dispose() {
    disposable.dispose(className: this.runtimeType.toString());
    super.dispose();
  }
}
