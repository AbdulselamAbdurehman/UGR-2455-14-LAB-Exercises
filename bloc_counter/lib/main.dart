import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
  }
}

// BLoC
class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class CounterState {
  final int count;

  CounterState(this.count);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementEvent>(
      (event, emit) => emit(CounterState(state.count + 1)),
    );
    on<DecrementEvent>(
      (event, emit) => emit(CounterState(state.count - 1)),
    );
  }
}

// UI
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count: ${state.count}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        counterBloc.add(IncrementEvent());
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        counterBloc.add(DecrementEvent());
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
