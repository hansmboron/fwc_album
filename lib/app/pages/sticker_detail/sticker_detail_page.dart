import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';

class StickerDetailPage extends StatefulWidget {
  const StickerDetailPage({Key? key}) : super(key: key);

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends State<StickerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticker detail'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/sticker.png'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'BRA',
                      style: context.textStyles.textPrimaryFontBold.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const Spacer(),
                  RoundedButton(
                    onPressed: () {},
                    icon: Icons.remove,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '1',
                      style: context.textStyles.textSecondaryFontMedium,
                    ),
                  ),
                  RoundedButton(
                    onPressed: () {},
                    icon: Icons.add,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Brasil',
                  style: context.textStyles.textPrimaryFontRegular,
                ),
              ),
              Button.primary(
                width: MediaQuery.of(context).size.width * .9,
                label: 'Adicionar Figurinha',
                onPressed: () {},
              ),
              Button(
                width: MediaQuery.of(context).size.width * .9,
                style: context.buttonStyles.primaryOutLineButton,
                outline: true,
                labelStyle:
                    context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                label: 'Excluir Figurinha',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
