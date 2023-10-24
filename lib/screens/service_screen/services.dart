import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/blocs/api/api_bloc.dart';
import 'package:flutter_application_1/model/events.dart';
import 'package:flutter_application_1/screens/widgets/bottomNavBar.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key, required this.event, required this.state});
  final List<Events> event;
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
                          child: state.events[index].imgUrl.isEmpty
                              ? const Center(child: Text("No Image"))
                              : Image.network(state.events[index].imgUrl),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(state.events[index].eventName),
                      ),
                      ExpansionTile(
                        iconColor: Colors.black,
                        textColor: Colors.black,
                        title: Text("Services Information"),
                        children: [
                          Text(state.events[index].decription),
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
