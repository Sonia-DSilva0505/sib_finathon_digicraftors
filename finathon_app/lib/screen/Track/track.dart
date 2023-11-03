import 'package:finathon_app/screen/Track/Tabs/my_tab.dart';
import 'package:finathon_app/screen/Track/re_use.dart';
import 'package:finathon_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    MyTab(
      text: 'Daily',
    ),
    // weekly tab
    MyTab(
      text: 'Weekly',
    ),
  ];

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
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
    'Save for gift'
  ];
  List<String> goalListAmt = ['2000', '1500', '500'];

  final TextEditingController _category = TextEditingController();
  final TextEditingController _amount = TextEditingController();

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 200,
          child: Scaffold(
           
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // goal section
                  const Text(
                    'Goals',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: goalList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 400,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 24),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          children: [
                                            inputText('Goal', 'eg: Buy a gift',
                                                _category, false),
                                            inputText('Amount', 'eg: 2000',
                                                _amount, false),
                                            // submit(
                                            //     context,
                                            //     _category.text.trim(),
                                            //     _amount.text
                                            //         ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: SizedBox(
                                // height: 120,
                                child: Row(
                                  children: [
                                    DottedBorder(
                                      borderType: BorderType.RRect,
                                      dashPattern: const [3, 3],
                                      color: R.primaryColor,
                                      strokeWidth: 4,
                                      radius: const Radius.circular(16),
                                      child: const SizedBox(
                                        width: 100,
                                        // height: 120,
                                        child: Center(
                                          child: Icon(
                                            Icons.add_circle_outline_outlined,
                                            size: 36,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                ),
                              ),
                            );
                          }
                          return Container(
                            margin: const EdgeInsets.only(right: 16),
                            width: 100,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: R.primaryColor,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Text(
                                  goalList[index - 1],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  goalListAmt[index - 1],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  const SizedBox(height: 24),

                  // daily weekly chart
                  tabsContainer(context, tabController!, myTabs),
                  const SizedBox(height: 8),

                  // expense section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Expenses',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
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
                  // SizedBox(
                  //   height: 120,
                  //   child: Row(
                  //     children: [
                  //       const SizedBox(width: 12),
                  //       StreamBuilder(
                  //           stream: homeController.getUserExpenseDetails(),
                  //           builder: (context, snapshot) {
                  //             if (snapshot.connectionState ==
                  //                 ConnectionState.waiting) {
                  //               return const Center(
                  //                 child: CircularProgressIndicator(),
                  //               );
                  //             }
                  //             List<Expense> expenseList1 = snapshot.data!;
                  //             return Expanded(
                  //               child: ListView.builder(
                  //                 itemCount: snapshot.data!.length + 1,
                  //                 scrollDirection: Axis.horizontal,
                  //                 shrinkWrap: true,
                  //                 itemBuilder: (context, index) {
                  //                   if (index == 0) {
                  //                     return GestureDetector(
                  //                       onTap: () {
                  //                         showModalBottomSheet(
                  //                             context: context,
                  //                             builder: (context) {
                  //                               return Container(
                  //                                 height: 400,
                  //                                 padding: const EdgeInsets.symmetric(
                  //                                     horizontal: 24,
                  //                                     vertical: 24),
                  //                                 decoration: BoxDecoration(
                  //                                   color: black,
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                           16),
                  //                                 ),
                  //                                 child: Column(
                  //                                   children: [
                  //                                     inputText(
                  //                                         'Category',
                  //                                         'eg: Food',
                  //                                         _category,
                  //                                         false),
                  //                                     inputText(
                  //                                         'Amount',
                  //                                         'eg: 2000',
                  //                                         _amount,
                  //                                         false),
                  //                                     submit(
                  //                                         context,
                  //                                         _category.text.trim(),
                  //                                         _amount.text),
                  //                                   ],
                  //                                 ),
                  //                               );
                  //                             });
                  //                       },
                  //                       child: Row(
                  //                         children: [
                  //                           DottedBorder(
                  //                             borderType: BorderType.RRect,
                  //                             dashPattern: [3, 3],
                  //                             color: midnightGreenLight,
                  //                             strokeWidth: 4,
                  //                             radius: const Radius.circular(16),
                  //                             child: Container(
                  //                               width: 100,
                  //                               child: const Center(
                  //                                 child: Icon(
                  //                                   Icons
                  //                                       .add_circle_outline_outlined,
                  //                                   size: 36,
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(width: 16),
                  //                         ],
                  //                       ),
                  //                     );
                  //                   }
                  //                   return Container(
                  //                     margin: const EdgeInsets.only(right: 16),
                  //                     width: 100,
                  //                     height: 120,
                  //                     decoration: BoxDecoration(
                  //                       border: Border.all(
                  //                         color: midnightGreenLight,
                  //                         width: 3,
                  //                       ),
                  //                       borderRadius: BorderRadius.circular(16),
                  //                     ),
                  //                     child: Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       children: [
                  //                         Container(
                  //                           width: 35,
                  //                           height: 35,
                  //                           child: Icon(
                  //                             (expenseList1[index - 1]
                  //                                         .category ==
                  //                                     'Food')
                  //                                 ? Icons.food_bank_rounded
                  //                                 : ((expenseList1[
                  //                                                 index - 1]
                  //                                             .category ==
                  //                                         'Shopping')
                  //                                     ? Icons
                  //                                         .shopping_bag_rounded
                  //                                     : Icons
                  //                                         .travel_explore_rounded),
                  //                             size: 36,
                  //                           ),
                  //                         ),
                  //                         const SizedBox(height: 5),
                  //                         Text(
                  //                           expenseList1[index - 1].category,
                  //                           style: const TextStyle(
                  //                             fontSize: 14,
                  //                             fontWeight: FontWeight.w400,
                  //                           ),
                  //                         ),
                  //                         const SizedBox(height: 2),
                  //                         Text(
                  //                           '${expenseList1[index - 1].amount}',
                  //                           style: const TextStyle(
                  //                             fontSize: 10,
                  //                             fontWeight: FontWeight.w400,
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   );
                  //                 },
                  //               ),
                  //             );
                  //           }),
                  //       const SizedBox(width: 12),
                  //     ],
                  //   ),
                  // ),
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
                        investNowPage(context, 1, 'stock', 'assets/stock.svg'),
                        investNowPage(context, 2, 'FD', 'assets/fd.svg'),
                        investNowPage(
                            context, 3, 'Equity', 'assets/mutual.svg'),
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
      ),
    );
  }
}
