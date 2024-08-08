import 'package:example_flutter_app/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    required this.child,
    required this.status,
    super.key,
    this.errorView,
  });
  final Widget child;
  final Widget? errorView;
  final AppStatus status;
  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AppStatus.success:
        EasyLoading.dismiss();
        return child;
      case AppStatus.initial:
      case AppStatus.inProgress:
        EasyLoading.show();
        return Container();
      case AppStatus.error:
        return errorView ?? Container();
    }
  }
}
