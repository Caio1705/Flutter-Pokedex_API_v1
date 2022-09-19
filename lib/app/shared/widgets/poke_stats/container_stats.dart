import 'package:flutter/material.dart';
import 'package:flutter_plants_app_v2/app/shared/widgets/container_text_type.dart';
import 'package:flutter_plants_app_v2/app/shared/widgets/poke_stats/tab_views/next_and_previous_evolution.dart';
import 'package:flutter_plants_app_v2/app/shared/widgets/poke_stats/tab_views/stats.dart';

class ContainerStats extends StatelessWidget {
  const ContainerStats({
    super.key,
    required this.containerSize,
    required this.index,
  });
  final double containerSize;
  final index;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: containerSize,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const TabBar(
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.black,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2),
              insets: EdgeInsets.symmetric(horizontal: 50),
            ),
            tabs: [
              SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    "Stats",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    "Evolution",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Stats(
                index: index,
              ),
              NextAndPreviousEvolution(
                index: index,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
