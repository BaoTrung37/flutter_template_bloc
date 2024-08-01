import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_teller/injection/di.dart';
import 'package:fortune_teller/presentation/app/cubit/app_cubit.dart';
import 'package:fortune_teller/presentation/utilities/enums/common/languages.dart';

@RoutePage()
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('More Screen'),
            BlocBuilder<AppCubit, AppState>(
              bloc: getIt<AppCubit>()..init(),
              builder: (context, state) {
                return DropdownButton<Languages>(
                  items: Languages.values
                      .map(
                        (language) => DropdownMenuItem(
                          value: language,
                          child: Text(language.name),
                        ),
                      )
                      .toList(),
                  value: state.currentLanguage,
                  onChanged: (value) {
                    getIt<AppCubit>().changeLanguage(value!);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
