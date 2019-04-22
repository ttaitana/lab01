import 'package:bloc/bloc.dart';
import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  // TODO: implement initialState
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case CounterEvent.decrement:
        yield currentState - 1;
        break;
      case CounterEvent.increment:
        yield currentState + 1;
        break;
      case CounterEvent.reset:
      yield currentState * 0;
      break;
    }
  }
}
