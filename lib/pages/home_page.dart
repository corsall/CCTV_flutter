import 'package:cctv/components/allert_button.dart';
import 'package:cctv/components/bottom_navigation_bar.dart';
import 'package:cctv/components/cctv_monitoring.dart';
import 'package:cctv/components/controller_pannel.dart';
import 'package:cctv/components/stats_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stats for CCTV"),
          flexibleSpace: const StatsBar(),
        ),
        body: const Column(
          children: [
            CCTVMonitoring(),
            ControllerPannel(),
          ],
        ),
        bottomNavigationBar: const NavBar(),
        floatingActionButton: AllertButton(title: "allert", onPressed: () => print("allert")),
      );
  }
}