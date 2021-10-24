import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter7plus/Bloc/CounterCubit/CounterStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  // call super constructor with the initial state
  CounterCubit() : super(InitialState());
  // create method that return object from cubit
  static CounterCubit getCounterCubit(BuildContext context){
     return BlocProvider.of(context);
  }
  //data
  int counter = 0;
  //methods
  void increment(){
    counter++;
    print(counter);
    emit(IncrementState());
  }
  void decrement(){
    counter--;
    print(counter);
    emit(DecrementState());
  }
  void reset(){
    counter = 0;
    emit(ResetState());
  }
}