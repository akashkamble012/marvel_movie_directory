import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../controller/loading_provider.dart';
import '../core/app_colors.dart';

class LoadingScreen {
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LoadingCustom(child: child!));
      } else {
        return LoadingCustom(child: child!);
      }
    };
  }
}

class LoadingCustom extends StatelessWidget {
  final Widget child;

  const LoadingCustom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: ChangeNotifierProvider<LoadingProvider>(
            create: (context) => LoadingProvider(),
            builder: (context, _) {
              return Stack(children: [
                child,
                Consumer<LoadingProvider>(builder: (context, provider, child) {
                  return provider.loading
                      ? DecoratedBox(
                          decoration:
                              const BoxDecoration(color: Colors.black12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              SpinKitRipple(color: AppColor.white),
                            ],
                          ),
                        )
                      : const SizedBox();
                })
              ]);
            }));
  }
}
