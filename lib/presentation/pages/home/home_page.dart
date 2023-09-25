import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/presentation/viewmodel/home_controller.dart';
import 'package:untitled/widgets/card_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Future<void> _refreshData() async {
      if (homeController.getModel().value == null) {
        await homeController.getLocationAndWeather();
      }
    }

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: kPaddingSmall),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blueGrey,
          tooltip: 'icon',
          onPressed: () {
            homeController.getLocationAndWeather();
          },
          child: const Icon(Icons.location_searching, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,

      body: RefreshIndicator.adaptive(
        onRefresh: _refreshData,
        child: Obx(
          () => homeController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: homeController.background().getWeather()),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            homeController.getModel().value!.city.name,
                            style: kTextStyleHomeBig,
                            softWrap: true,
                            maxLines: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${homeController.temp()}º${homeController.celcius ? 'C' : 'F'}',
                                style: kTextStyleHomeExtra,
                                softWrap: true,
                                maxLines: 2,
                              ),
                              FloatingActionButton.small(
                                onPressed: () => {homeController.changeUnity()},
                                shape: const CircleBorder(),
                                backgroundColor: Colors.blueGrey,
                                tooltip: 'temp',
                                child: const Icon(Icons.change_circle,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Max. ${homeController.maxTemp()}º',
                                style: kTextStyleHome,
                              ),
                              const Icon(
                                Icons.arrow_upward_outlined,
                                color: Colors.white,
                                size: kSizeMedium,
                              ),
                              Text(
                                'Min. ${homeController.minTemp()}º',
                                style: kTextStyleHome,
                              ),
                              const Icon(
                                Icons.arrow_downward_outlined,
                                color: Colors.white,
                                size: kSizeMedium,
                              ),
                            ],
                          ),
                          Text(
                            dateFormat.format(DateTime.now()),
                            style: kTextStyleHome,
                          ),
                          SizedBox(
                            height: kSizeExtra,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return CardButton(
                                  onTap: () {
                                    setState(() {
                                      homeController.getWeather(
                                          cityId: cities[index].id);
                                    });
                                  },
                                  city: cities[index].name,
                                  temp: homeController
                                      .getModel()
                                      .value!
                                      .list[0]
                                      .main
                                      .temp
                                      .toString(),
                                );
                              },
                              itemCount: cities.length,
                            ),
                          ),
                        ]),
                  ],
                ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
