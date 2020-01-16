import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'menu.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

String selectedUrl = 'https://merzlyakov.pro/';

class DefaultPage extends StatefulWidget {
    const DefaultPage({Key key, this.title}) : super(key: key);
    final String title;

    @override
    _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
    final Completer<WebViewController> _controller = Completer<WebViewController>();

    @override
    void initState () {
        super.initState();
    }

    @override
    void dispose () {
        super.dispose();
    }

    @override
    Widget build (BuildContext context) {
        return Scaffold(
            drawer: MenuDrawer(),
            appBar: AppBar(
                title: const Text('Loyalty program'),
            ),
            body: Builder(builder: (BuildContext context) {
                return WebView(
                    initialUrl: selectedUrl,
                    javascriptMode: JavascriptMode.unrestricted,

                    onWebViewCreated: (WebViewController webViewController) {
                        _controller.complete(webViewController);
                    },
                    javascriptChannels: <JavascriptChannel>[
                        _toasterJavascriptChannel(context),
                    ].toSet(),
                    navigationDelegate: (NavigationRequest request) {
                        if (request.url.startsWith('https://www.youtube.com/')) {
                            print('blocking navigation to $request}');
                            return NavigationDecision.prevent;
                        }
                        print('allowing navigation to $request');
                        return NavigationDecision.navigate;
                    },
                    onPageStarted: (String url) {
                        print('Page started loading: $url');
                    },
                    onPageFinished: (String url) {
                        print('Page finished loading: $url');
                    },
                    gestureNavigationEnabled: true,
                    userAgent: kAndroidUserAgent,
                    debuggingEnabled: true,
                );
            }),
        );
    }

    JavascriptChannel _toasterJavascriptChannel (BuildContext context) {
        return JavascriptChannel(
            name: 'Toaster',
            onMessageReceived: (JavascriptMessage message) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text(message.message)),
                );
            });
    }

}