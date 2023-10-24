import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';

import 'package:flutter_application_1/model/services.dart';
import 'package:flutter_application_1/screens/services_card.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesRow extends StatefulWidget {
  List<Services> services;

  ServicesRow({
    super.key,
    required this.services,
  });

  @override
  State<ServicesRow> createState() => _ProductRowState();
}

class _ProductRowState extends State<ServicesRow> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: BlocBuilder<ApiProductBloc, ApiProductState>(
        builder: (context, state) {
          if (state is ProductApiLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductApiFetchingSuccessfulState) {
            widget.services = state.services;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.services.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ServicesCard(
                    index: index,
                    state: state,
                    service: widget.services[index],
                    widthfactor: 2.5,
                  ),
                );
              },
            );
          } else {
            return Text("Something went wrong");
          }
        },
      ),
    );
  }
}
