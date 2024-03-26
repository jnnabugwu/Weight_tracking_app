import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofi_interview_2/bloc/log_cubit.dart';
import 'package:sofi_interview_2/bloc/log_cubit.dart';

///Need to added
/// get all notes then use it to make a listview builder
///

class WeightDisplayScreen extends StatelessWidget {
  const WeightDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LogCubit>(context).getAllLogs();

    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Tracking App', style: ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/add_weight");
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<LogCubit, LogState>(builder: (context, state) {
        if (state is! LogLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        final logs = state.notes;

        ///WE want to display the date, the weight and the notes
        return SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * .75,
          child: ListView.builder(
            itemCount: logs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(
                      "${logs[index].timestamp.toUtc()} ${logs[index].weight.toString()} "),
                  subtitle: Text(logs[index].note),
                ),
              );
            },
          ),
        ));
      }),
    );
  }
}
