import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/blocs/api/api_bloc.dart';
import 'package:flutter_application_1/model/services.dart';
import 'package:flutter_application_1/screens/widgets/bottomNavBar.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key, required this.services, required this.state});
  final List<Services> services;
  final ProductApiFetchingSuccessfulState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: state.services.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: state.services[index].serviceImageUrl == null
                              ? const Center(child: Text("No Image"))
                              : Image.network(
                                  state.services[index].serviceImageUrl),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(state.services[index].serviceName),
                      ),
                      ExpansionTile(
                        iconColor: Colors.black,
                        textColor: Colors.black,
                        title: Text("Services Information"),
                        children: [
                          Text(state.services[index].serviceDescription),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
