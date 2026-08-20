import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebVeiw extends StatefulWidget {
  final String url;
  const NewsWebVeiw({super.key, required this.url});

  @override
  State<NewsWebVeiw> createState() => _NewsWebVeiwState();
}

class _NewsWebVeiwState extends State<NewsWebVeiw> {
  late WebViewController webViewController;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            WebViewWidget(controller: webViewController),
            if (isLoading)
              Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: AppColors.greyColor,
                  size: 45,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
