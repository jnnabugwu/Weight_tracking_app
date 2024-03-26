import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofi_interview_2/bloc/addlog_cubit.dart';
import 'package:sofi_interview_2/bloc/log_cubit.dart';
import 'package:sofi_interview_2/presentation/error_page.dart';
import 'package:sofi_interview_2/presentation/weight_display_page.dart';
import 'package:sofi_interview_2/presentation/weight_input.dart';
import 'package:sofi_interview_2/repository/notebook.dart';

class AppRouter {
  late NotebookRepository repo;
  late LogCubit logCubit;
  AppRouter() {
    repo = NotebookRepository(notes: []);
    logCubit = LogCubit(repository: repo);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: logCubit,
            child: const WeightDisplayScreen(),
          ),
        );

      case "/add_weight":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => AddLogCubit(
              repo,
              logCubit,
            ),
            child: WeightInput(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}
