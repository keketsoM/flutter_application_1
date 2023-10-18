import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("hello")),
      body: BlocBuilder<ApiProductBloc, ApiProductState>(
        builder: (context, state) {
          if (state is ProductApiLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductApiFetchingSuccessfulState) {
            print(state);
            return Scaffold(
              body: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(state.products[index].productDescription),
                      Image.network(state.products[index].imageLink),
                      Text(state.services[index].serviceName),
                    ],
                  );
                },
              ),
            );
          } else {
            print("Error State: ${state} something is wrong");
            return Text("Error State: ${state} something is wrong");
          }
        },
      ),
    );
  }
}
