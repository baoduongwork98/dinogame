import 'dart:ui';

import 'package:dino_run/game/dino_run.dart';
import 'package:dino_run/widgets/main_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonateMenu extends StatelessWidget {
  static const id = 'DonateMenu';
  // Reference to parent game.
  final DinoRun game;

  const DonateMenu(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: game.settings,
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.black.withAlpha(100),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Donate',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        game.overlays.remove(DonateMenu.id);
                        game.overlays.add(MainMenu.id);
                      },
                      child: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
