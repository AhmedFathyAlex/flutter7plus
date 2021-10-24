import 'package:flutter/material.dart';
import 'package:flutter7plus/Bloc/CounterCubit/CounterCubit.dart';
import 'package:flutter7plus/Bloc/CounterCubit/CounterStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterBloc extends StatelessWidget {
  const CounterBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){},
        builder: (context,state){
          var myCubit = CounterCubit.getCounterCubit(context);
          return  Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                myCubit.reset();
              },
              child: Text('Reset'),
            ),
            appBar: AppBar(title: Text("Bloc"),),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    myCubit.decrement();
                  } , child: Icon(Icons.remove)),
                  SizedBox(width: 30,),
                  Text('${myCubit.counter}'),
                  SizedBox(width: 30,),
                  ElevatedButton(onPressed:(){
                    myCubit.increment();
                  } , child: Icon(Icons.add)),
                ],
              ),
            ),

          );
        },
      ),
    );
  }
}
