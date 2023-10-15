import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Repository/productRepo.dart';
import 'package:flutter_application_1/model/blocs/Api/api_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiProductBloc, ApiProductState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<ApiProductBloc>().add(ApiProductStarted());
                      //ProductRepo.getProducts();
                    },
                    child: const Icon(Icons.download))
              ],
            ),
          ),
        );
      },
    );
  }
}
