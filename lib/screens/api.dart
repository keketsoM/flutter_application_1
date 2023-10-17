import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_application_1/model/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  @override
  void initState() {
    context.read<ApiProductBloc>().add(ApiProductFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<ApiProductBloc>().add(ApiProductFetch());
    return Scaffold(
        appBar: AppBar(title: const Text("hello")),
        body: BlocBuilder<ApiProductBloc, ApiProductState>(
          builder: (context, state) {
            if (state is ProductApiInitialState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductApiFetchingSuccessfulState) {
              return Scaffold(
                body: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Text(state.products[index].productDescription),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Text("something is wrong");
            }
          },
        ));
  }
}
