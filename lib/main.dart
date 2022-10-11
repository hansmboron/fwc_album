import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/fwc_album_app.dart';

void main() {
  runApp(const FwcAlbumApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: ColorsApp.i.primary,
    ),
  );
}
