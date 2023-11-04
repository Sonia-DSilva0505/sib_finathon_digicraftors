import 'package:dots_indicator/dots_indicator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:finathon_app/provider/ui_provider.dart';
import 'package:finathon_app/screen/question_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../utils/banking_colors.dart';
import '../utils/banking_contants.dart';
import '../utils/banking_images.dart';
import '../utils/banking_widget.dart';
import '../utils/icon_text.dart';

List<IconText?> icons = List.generate(8, (index) => null);

class BankingHome1 extends StatefulWidget {
  static String tag = '/BankingHome1';

  const BankingHome1({super.key});

  @override
  BankingHome1State createState() => BankingHome1State();
}

class BankingHome1State extends State<BankingHome1> {
  int currentIndexPage = 0;
  int? pageLength;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 3;
  }

  @override
  Widget build(BuildContext context) {
    //provider
    final uiProvider = Provider.of<UIProvider>(context, listen: true);
    List<DragTarget<IconText>> dragTargets = List.generate(8, (index) {
      return DragTarget<IconText>(
        onAccept: (data) {
          if (icons[index] == null && isEditing) {
            icons[index] = data;
          }
        },
        builder: (BuildContext context, List<IconText?> candidateData,
            List<dynamic> rejectedData) {
          return DottedBorder(
            color: icons[index]?.text == null
                ? Colors.grey
                : Banking_app_Background,
            // gap: 3,

            strokeWidth: 1,
            child: Container(
              color: const Color(0xffd6d6d6),
              width: 55,
              height: 55,
              child: Center(
                child: icons[index] != null
                    ? icons[index]!
                    : isEditing
                        ? const Text(
                            'Drag here',
                            style: TextStyle(
                              fontSize: 7,
                            ),
                          )
                        : const SizedBox.shrink(),
              ),
            ),
          );
        },
      );
    });
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 330,
              floating: false,
              pinned: true,
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              backgroundColor:
                  innerBoxIsScrolled ? Banking_Primary : Banking_app_Background,
              actionsIconTheme: const IconThemeData(opacity: 0.0),
              title: Container(
                padding: const EdgeInsets.fromLTRB(16, 42, 16, 32),
                margin: const EdgeInsets.only(bottom: 8, top: 8),
                child: Row(
                  children: [
                    const CircleAvatar(
                        backgroundImage: AssetImage(Banking_ic_user1),
                        radius: 24),
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Hello, Abhishek",
                            style: primaryTextStyle(
                                color: Colors.black,
                                size: 20,
                                weight: FontWeight.bold,
                                fontFamily: fontRegular)),
                        // Text("How are you today?",
                        //     style: primaryTextStyle(
                        //         color: Banking_TextColorWhite,
                        //         size: 16,
                        //         fontFamily: fontRegular)),
                      ],
                    ).expand(),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.message,
                        size: 30, color: Colors.black54))
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topLeft,
                            colors: <Color>[Banking_Primary, Colors.white]),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 80, 16, 8),
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: defaultBoxShadow()),
                      child: Column(mainAxisSize:MainAxisSize.min ,
                        children: [
                          SizedBox(
                            height: 130,
                            child: PageView(
                              children: const [
                                TopCard(
                                    name: "Default Account",
                                    acno: "158169945138",
                                    bal: "\$12,500"),
                                TopCard(
                                    name: "Adam Johnson",
                                    acno: "9874563210",
                                    bal: "\$18,000"),
                                TopCard(
                                    name: "Ana Willson",
                                    acno: "5821479630",
                                    bal: "\$12,500"),
                              ],
                              onPageChanged: (value) {
                                setState(() => currentIndexPage = value);
                              },
                            ),
                          ),
                          8.height,
                          Align(
                            alignment: Alignment.center,
                            child: DotsIndicator(
                              dotsCount: 3,
                              position: currentIndexPage.toInt(),
                              decorator: const DotsDecorator(
                                size: Size.square(8.0),
                                activeSize: Size.square(8.0),
                                color: Banking_view_color,
                                activeColor: Banking_TextColorPrimary,
                              ),
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: Banking_Primary,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.payment,
                                        color: Banking_TextColorWhite,
                                        size: 24),
                                    10.width,
                                    Text('Payment',
                                        style: primaryTextStyle(
                                            size: 16,
                                            color: Banking_TextColorWhite)),
                                  ],
                                ),
                              ).expand(),
                              10.width,
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: Banking_Primary,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Banking_ic_Transfer,
                                      colorFilter: const ColorFilter.mode(
                                          Banking_TextColorWhite,
                                          BlendMode.srcIn),
                                    ),
                                    10.width,
                                    Text('Transfer',
                                        style: primaryTextStyle(
                                            size: 16,
                                            color: Banking_TextColorWhite)),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ).paddingAll(16)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Banking_app_Background,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Customoizable widget
                  SizedBox(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Quick Access",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isEditing = !isEditing;
                                });
                                showBottomSheet(
                                  enableDrag: true,
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: const [
                                          Draggable<IconText>(
                                            data: IconText(
                                                iconPath: "images/icons/fd.png",
                                                text: "balance"),
                                            feedback: Icon(Icons.balance),
                                            child: IconText(
                                                iconPath: "images/icons/fd.png",
                                                text: "balance"),
                                          ),
                                          Draggable<IconText>(
                                            data: IconText(
                                                iconPath: "images/icons/fd.png",
                                                text: "balance"),
                                            feedback: Icon(Icons.balance),
                                            child: IconText(
                                                iconPath: "images/icons/fd.png",
                                                text: "balance"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Image.asset(
                                "images/icons/write.png",
                                color: Colors.grey,
                                width: 16,
                              )),
                        ],
                      ),
                    ],
                  )),
                  Wrap(
                    spacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      for (var target
                          in isEditing ? dragTargets : uiProvider.iconList)
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: target,
                        )
                    ],
                  ),
                  const SurveyWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
