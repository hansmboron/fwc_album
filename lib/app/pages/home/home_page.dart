import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/home/widgets/status_tile.dart';
import 'package:fwc_album_app/app/pages/home/widgets/sticker_percent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            onPressed: () async {
              final sp = await SharedPreferences.getInstance();
              sp.remove('accessToken');
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (_, constrains) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constrains.maxHeight),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          'assets/images/bola.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const StickerPercent(percent: 60),
                      const SizedBox(height: 20),
                      Text(
                        '45 Figurinhas',
                        style: context.textStyles.titleWhite,
                      ),
                      const SizedBox(height: 20),
                      StatusTile(
                        icon: Image.asset('assets/images/all_icon.png'),
                        label: 'Todas',
                        value: 45,
                      ),
                      const SizedBox(height: 20),
                      StatusTile(
                        icon: Image.asset('assets/images/missing_icon.png'),
                        label: 'Faltando',
                        value: 500,
                      ),
                      const SizedBox(height: 20),
                      StatusTile(
                        icon: Image.asset('assets/images/repeated_icon.png'),
                        label: 'Repetidas',
                        value: 20,
                      ),
                      const SizedBox(height: 20),
                      Button(
                        onPressed: () {},
                        width: MediaQuery.of(context).size.width * .9,
                        style: context.buttonStyles.yellowOutLineButton,
                        labelStyle: context
                            .textStyles.textSecondaryFontExtraBold
                            .copyWith(
                          color: context.colors.yellow,
                        ),
                        label: 'Minhas Figurinhas',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
