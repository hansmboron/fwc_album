import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/pages/my_stickers/my_stickers_page.dart';

import './my_sticker_view.dart';

abstract class MyStickerViewImpl extends State<MyStickersPage>
    with Loader<MyStickersPage>, Messages<MyStickersPage>
    implements MyStickerView {
  var album = <GroupsStickers>[];
  var statusFilter = 'all';

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getMyAlbum();
    });
    super.initState();
  }

  @override
  void error(String message) => showError(message);

  @override
  void loadedPage(List<GroupsStickers> album) {
    setState(() {
      this.album = album;
    });
  }

  @override
  void updateStatusFilter(status) {
    setState(() {
      statusFilter = status;
    });
  }
}
