import 'package:base_project_flutter/export.dart';

class BaseScaffold extends StatefulWidget {
  final Widget? child;

  const BaseScaffold({super.key, required this.child});

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> with WidgetsBindingObserver {
  @override
  void initState() {
    // initStateFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ValueListenableBuilder(
          valueListenable: Global.isNetworkDisabled,
          builder: (_, value, __) {
            return Global.isNetworkDisabled.value == true ? const NoInternetScreen() : widget.child!;
          },
        ),
      ],
    );
  }
}
