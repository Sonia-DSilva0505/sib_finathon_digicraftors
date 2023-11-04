import 'package:finathon_app/provider/goal_provider.dart';
import 'package:finathon_app/screen/All%20Expenses/transaction_list_widget.dart';
import 'package:finathon_app/screen/Track/Tabs/my_tab.dart';
import 'package:finathon_app/screen/Track/re_use.dart';
import 'package:finathon_app/model/expense.dart';
import 'package:finathon_app/screen/Track/show_goal_widget.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/banking_colors.dart';
import '../MapScreen/map_screen.dart';
import '../../utils/app_colors.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking>
    with SingleTickerProviderStateMixin {
  // my tabs
  List<MyTab> myTabs = const [
    // daily tab

    // weekly tab
    MyTab(
      text: 'Weekly',
    ),
    MyTab(
      text: 'Monthly',
    ),
  ];

   List<String> top3 = [
    'Jay',
    'Divya',
    'Shreya',
  ];
  List<String> userList = [
    'Het',
    'Nishtha',
    'Vatsal',
    'Abhishek',
    'Anjali',
    'Rahul'
  ];

  TabController? tabController;
  String sms = 'no sms received';
  String sender = 'no sms received';
  String time = 'no sms received';

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<bool> getPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.sms.request() == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  // my expenses or transactions whatever
  List<Expense> expenseList = [
    Expense(
        time: DateTime(2023),
        amount: 3000,
        category: 'Food',
        lat: 23.09,
        lng: 45.03),
    Expense(
        time: DateTime(2023),
        amount: 3000,
        category: 'Shopping',
        lat: 23.09,
        lng: 45.03),
    Expense(
        time: DateTime(2023),
        amount: 3000,
        category: 'Travel',
        lat: 23.09,
        lng: 45.03),
  ];

  List<String> goalList = [
    'Buy a new phone',
    'Save for college',
  ];
  List<String> goalListAmt = [
    '20000',
    '1500',
  ];

  final TextEditingController _category = TextEditingController();
  final TextEditingController _amount = TextEditingController();
   final _pageController = PageController();

  
  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                // goal section
                goalProvider.is_goal_assigned
                    ? const Text(
                        ' Goal',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      )
                    : const Text(
                        'Add Monthly Goal',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                const SizedBox(height: 16),
                goalProvider.is_goal_assigned
                    ? const ShowGoalWidget()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  
                                  builder: (context) {
                                    return Padding(
                                      padding:  EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Colors.white54,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              inputText('Goal', 'eg: Buy a gift',
                                                  _category, false),
                                              inputText('Amount', 'eg: 2000',
                                                  _amount, false),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding:
                                                        const EdgeInsets.all(18),
                                                    backgroundColor:
                                                        R.primaryColor),
                                                onPressed: () {
                                                  //set amount and desc
                                                  goalProvider.goal_amount =
                                                      _amount.text;
                                                  goalProvider.goal_desc =
                                                      _category.text;
                                                  goalProvider.is_goal_assigned =
                                                      true;
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Add Monthly Goal",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              dashPattern: const [3, 3],
                              color: R.primaryColor,
                              strokeWidth: 4,
                              radius: const Radius.circular(16),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 27.0),
                                  child: Icon(
                                    Icons.add_circle_outline_outlined,
                                    size: 36,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            height: 100,
                            child: ListView.builder(
                              itemCount: goalList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _amount.text = goalListAmt[index];
                                      _category.text = goalList[index];
                                    });
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24, vertical: 24),
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Colors.white54,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  inputText(
                                                      'Goal',
                                                      goalList[index],
                                                      _category,
                                                      false),
                                                  inputText(
                                                      'Amount',
                                                      goalListAmt[index],
                                                      _amount,
                                                      false),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(18),
                                                            backgroundColor:
                                                                R.primaryColor),
                                                    onPressed: () {
                                                      //set amount and desc
                                                      goalProvider.goal_amount =
                                                          _amount.text;
                                                      goalProvider.goal_desc =
                                                          _category.text;
                                                      goalProvider
                                                              .is_goal_assigned =
                                                          true;
                                                      setState(() {});
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      "Add Monthly Goal",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: R.primaryColor,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: SizedBox(
                                          width: 70,
                                          height: 80,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                goalList[index],
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                goalListAmt[index],
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 24),

                // daily weekly chart
                tabsContainer(context, tabController!, myTabs),
                const SizedBox(height: 8),
                PieChart(
                  dataMap: const {
                    "Food": 500,
                    "Transportation": 300,
                    "Rent": 700,
                    // Add more categories if needed
                  },
                  animationDuration: const Duration(milliseconds: 1000),
                  chartLegendSpacing: 38,
                  chartRadius: MediaQuery.of(context).size.width / 1.8,
                  colorList: [
                    R.primaryColor,
                    R.primaryColor.withOpacity(0.5),
                    R.primaryColor.withOpacity(0.2),
                  ],
                  chartType: ChartType.disc,
                  ringStrokeWidth: 0,
                  legendOptions: const LegendOptions(
                    legendShape: BoxShape.rectangle,
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendTextStyle: TextStyle(fontSize: 12),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                    chartValueStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // expense section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Expenses',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MapScreen()));
                        },
                        icon: const Icon(Icons.location_on)),
                  ],
                ),
                const SizedBox(height: 16),
                  Column(
                    children: [
                      // top 3
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        // height: 160,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:Banking_greyColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            leaderboardTop3PerUser(top3, 2),
                            Positioned(
                              top: -60,
                              left: MediaQuery.of(context).size.width / 3.5,
                              child: leaderboardTop3PerUser(top3, 1),
                            ),
                            Positioned(
                              right: 0,
                              child: leaderboardTop3PerUser(top3, 3),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // rest users
                      Container(
                        height: 260,
                        decoration: BoxDecoration(
                          color: Banking_greyColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListView.builder(
                          itemCount: userList.length,
                          shrinkWrap: true,
                          // scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final newindex = index + 4;
                            return Column(
                              children: [
                                ListTile(
                                  leading: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:Banking_greyColor,
                                        radius: 24,
                                        child: CircleAvatar(
                                          radius: 20,
                                          child: Image.asset(
                                              "images/banking/profile_avatar.png"),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 12,
                                        right: -8,
                                        child: CircleAvatar(
                                          backgroundColor:Banking_greyColor,
                                          radius: 10,
                                        ),
                                      ),
                                      Positioned(
                                        top: 14,
                                        right: -3,
                                        child: Text(
                                          '$newindex',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Text(userList[index]),
                                ),
                                const SizedBox(height: 2),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                const TranstionList(),
                const SizedBox(height: 32),
                // invest section
                const Text(
                  'Invest Now!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: investNowPage(
                            context, 1, 'Stock', 'images/banking/banner.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: investNowPage(
                            context, 2, 'FD', 'images/banking/banner.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: investNowPage(
                            context, 3, 'Equity', 'images/banking/banner.jpg'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: R.lightPrimaryColor,
                        dotColor: R.lightPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
