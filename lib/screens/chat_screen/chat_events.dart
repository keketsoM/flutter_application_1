import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/blocs/api/api_bloc.dart';
import 'package:flutter_application_1/screens/chat_screen/chat.dart';
import 'package:flutter_application_1/screens/event/event.dart';
import 'package:flutter_application_1/route_mananger/route.dart';
import 'package:flutter_application_1/screens/services.dart';
import 'package:flutter_application_1/screens/widgets/common_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ask My Peers"),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.chat),
              text: "ChatBoard",
            ),
            Tab(
              icon: Icon(Icons.event),
              text: "Events",
            ),
          ]),
        ),
        drawer: const DrawerBar(),
        body: BlocBuilder<ApiProductBloc, ApiProductState>(
          builder: (context, state) {
            if (state is ProductApiLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductApiFetchingSuccessfulState) {
              return TabBarView(children: [
                ChatScreen(),
                ServiceScreen(
                  services: state.services,
                  state: state,
                ),
              ]);
            } else {
              return const Text("Something went wrong");
            }
          },
        ),
      ),
    );
  }
}
