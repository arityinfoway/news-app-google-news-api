import 'package:url_launcher/url_launcher.dart' as urlLauncher;
class AppService{
  Future openLink(context, String url) async {
    if (await urlLauncher.canLaunch(url)) {
      urlLauncher.launch(url);
    } else {

    }
  }
}