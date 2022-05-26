import 'package:demo_template/Constants/Localizations/AppText.dart';
import 'package:demo_template/Controller/HomeController.dart';
import 'package:demo_template/Models/APIs/APIService.dart';
import 'package:demo_template/Models/User.dart';
import 'package:demo_template/Routing/RouteNames.dart';
import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:demo_template/UI/Styling/SizeConfig.dart';
import 'package:demo_template/UI/Widgets/BaseCommonWidget.dart';
import 'package:demo_template/UI/Widgets/CustomSliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> with BaseCommonWidget {
  final HomeController homeController = Get.put(HomeController());
  final APIService apiService = Get.put(APIService());
  late User user;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: homeController,
      builder: (HomeController controller) {
        return LayoutBuilder(
          builder: (context, constraints) {
            SizeConfig().init(context, constraints);
            return Scaffold(
              backgroundColor: AppColor.whiteColor,
              appBar: AppBar(
                title: Text(home),
                backgroundColor: AppColor.blueAccentColor,
                // actions: [
                // IconButton(
                //   onPressed: () async {
                //     controller.logoutGoogle();
                //   },
                //   icon: const Icon(
                //     Icons.logout,
                //   ),
                // ),
                // ],
              ),
              body: _getBody(controller),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  var data = await Get.toNamed(addUserRoute);

                  if (data == true) {
                    user;
                  }
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _getBody(HomeController controller) {
    return Stack(
      children: <Widget>[
        _getBaseContainer(controller),
        getProgressBar(controller.state),
      ],
    );
  }

  Widget _getBaseContainer(HomeController controller) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // color: AppColor.whiteColor,
              height: 500,
              child: ListView.builder(
                itemCount: controller.list.length,
                padding: const EdgeInsets.only(
                  // left: 20,
                  // right: 20,
                  top: 30,
                  bottom: 30,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: CustomSlidableWidget(user: controller.list[index]),
                      ),
                    ],
                  );
                },
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
