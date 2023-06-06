import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/blocs/internet_bloc/internet_bloc.dart';
import 'package:project_1/blocs/internet_bloc/internet_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLOC'),
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Connected'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Not Connected'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text('Connected!');
            } else if (state is InternetLostState) {
              return const Text('Not Connected!');
            } else {
              return const Text('Loading...');
            }
          },
        ),

        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     if (state is InternetGainedState) {
        //       return const Text('Connected!');
        //     } else if (state is InternetLostState) {
        //       return const Text('Not Connected!');
        //     } else {
        //       return const Text('Loading...');
        //     }
        //   },
        // )
      ),
    );
  }
}

// BLOC- intermediate between UI and Data
// in BLOC- Events are added and state are emitted

// == is used to check values and 'is' is used to check data Types