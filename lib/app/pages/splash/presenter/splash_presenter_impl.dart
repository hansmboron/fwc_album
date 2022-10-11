import 'package:fwc_album_app/app/pages/splash/view/splash_view.dart';

import './splash_presenter.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();
    await Future.delayed(const Duration(seconds: 3));
    _view.logged(false);
  }

  @override
  set view(view) => _view = view;
}
