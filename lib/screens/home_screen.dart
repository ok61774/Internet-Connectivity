import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/internet_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Center(child: Text('Internet Connected')),
              backgroundColor: Colors.green,
            ));
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Center(child: Text("Not Connected")),
              //om
              backgroundColor: Colors.red,
            ));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is InternetGainedState) {
            return const Text('Connected');
          } else if (state is InternetLostState) {
            return const Text("Not Connected");
          } else {
            return const Text('Loading...');
          }
        },
      ),
    )));
  }
}
