import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sofi_interview_2/bloc/addlog_cubit.dart';
import 'package:sofi_interview_2/model/log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightInput extends StatelessWidget {
  ///create 2 inputs and 2 controller
  final weightInputController = TextEditingController();
  final noteController = TextEditingController();

  WeightInput({super.key});

  ///a button to add as well
  ///
  @override
  build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AddLogCubit, AddLogState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LogAdded) {
          Navigator.pop(context);
        } else if (state is AddingLog) {
          const CircularProgressIndicator();
        } else if (state is AddLogError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Column(children: [
          const Text('Input Weight'),
          TextField(
            controller: weightInputController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(
            height: 25,
          ),
          const Text('Input Notes'),
          TextField(
            controller: noteController,
          ),
          ElevatedButton(
              onPressed: () {
                Log log = Log(
                    note: noteController.text,
                    weight: double.parse(weightInputController.text),
                    timestamp: DateTime.now());
                BlocProvider.of<AddLogCubit>(context).addLog(log);
              },
              child: const Text('Enter a weight journal :^)'))
        ]);
      },
    ));
  }
}
