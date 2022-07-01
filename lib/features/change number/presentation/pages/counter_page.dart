import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../show users/representation/pages/users_screen.dart';
import '../bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  void _incrementCounter(BuildContext context) {
    var cubit = BlocProvider.of<CounterBloc>(
      context,
    );

    cubit.add(CounterIncreased());
  }

  void _decreaseCounter(BuildContext context) {
    var cubit = BlocProvider.of<CounterBloc>(
      context,
    );

    cubit.add(CounterDecreased());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Text(
                  '${state.num}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsersScreen(),
                    ));
              },
              child: const Text("Go to Users Screen"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _decreaseCounter(context);
                    },
                    child: const Icon(Icons.exposure_minus_1)),
                ElevatedButton(
                  onPressed: () {
                    _incrementCounter(context);
                  },
                  child: const Icon(Icons.plus_one),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
