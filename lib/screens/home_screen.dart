import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languageapp2/cubit/main_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.welcome),
        backgroundColor: Colors.deepPurple
      ),
      body: Center(
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return SwitchListTile(
              value:
                  MainCubit.get(context).currentLang == const Locale('en', ''),
              onChanged: (value) {
                if (AppLocalizations.of(context)!.localeName == "ar") {
                  MainCubit.get(context).changeLangToEn();
                } else {
                  MainCubit.get(context).changeLangToAr();
                }
              },
              title: Text(AppLocalizations.of(context)!.changelang),
              
            );
          },
        ),
      ),
    );
  }
}