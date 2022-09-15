import 'package:flutter/material.dart';
import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  final Widget child;
  const Layout(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<Screen>(create: (context) {
      final provider = Screen();
      provider.screenSize = size;
      return Screen();
    }, builder: (context, _) {
      return Scaffold(
        body: Stack(
          children: [
           child,
            Positioned(
                top: 0,
                left: 0,
                child: Consumer<Screen>(builder: (context, provider, child) {
                  return _loader(provider.loading, size);
                })),
            Positioned(
                top: 0,
                left: 0,
                child: Consumer<Screen>(builder: (context, provider, child) {
                  return _toast(
                      provider.renderToast, provider.toastMessage, size);
                }))
          ],
        ),
      );
    });
  }

  Widget _loader(bool isLoading, Size size) {
    return isLoading
        ? Container(
            width: size.width,
            height: size.height,
            color: Colors.white.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(color: Colors.red),
            ),
          )
        : Container();
  }

  Widget _toast(bool showToast, String message, Size size) {
    return showToast
        ? SizedBox(
            height: size.height,
            width: size.width,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.65)),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        : Container();
  }

  _showToast(String message, context) async {
    await sleep(500);

    late BuildContext dialogContext;
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (_) {
          dialogContext = _;
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.65)),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        });

    await sleep(4000);
    Navigator.pop(dialogContext);
  }
}
