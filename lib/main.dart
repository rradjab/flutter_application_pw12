import 'package:clean_arch_business/clean_arch_business.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  BlocFactory.instance.initialize();
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final BusinessBloc _businessBloc;

  @override
  void initState() {
    super.initState();
    _businessBloc = GetIt.I.get<BusinessBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BusinessBloc>(
      create: (context) => _businessBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Clean Architecture',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocBuilder<BusinessBloc, BusinessState>(
          bloc: _businessBloc,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text('Clean Architecture'),
              ),
              body: Center(
                child: switch (state) {
                  BusinessLoadingState() => const CircularProgressIndicator(),
                  BusinessLoadedState() => ListView.builder(
                      itemCount: state.result.split('^').length,
                      itemBuilder: (context, index) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(state.result.split('^')[index]),
                            ),
                          )),
                  BusinessState() => Center(child: Text(state.result)),
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () =>
                    context.read<BusinessBloc>().add(BusinessLoadEvent()),
                child: const Icon(Icons.perm_device_info_outlined),
              ),
            );
          },
        ),
      ),
    );
  }
}
