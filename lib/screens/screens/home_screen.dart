import 'package:flutter/material.dart';
import 'package:queezy/common/common.dart';
import 'package:queezy/di/service_locator.dart';
import 'package:queezy/routes/routes.dart';
import 'package:queezy/screens/screens/invite_friends_screen.dart';
import 'package:queezy/service/local_storage_service.dart';
import 'package:queezy/widgets/buttons_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = getIt<LocalStorageService>().getUser()?.data;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.wb_sunny_outlined,
                                color: Color(0xffFFD6DD),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "GOOD MORNING",
                                style: context.textTheme.bodySmall!.copyWith(
                                  color: Color(0xffFFD6DD),
                                  fontFamily: FontFamily.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${currentUser?.name}",
                            style: context.textTheme.headlineSmall!.copyWith(
                              fontFamily: FontFamily.w500,
                              color: context.colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      Image.network("${currentUser?.avatar}", scale: 3),
                    ],
                  ),
                  const SizedBox(height: 24),
                  RecentQuizCard(),
                  const SizedBox(height: 24),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/card_design.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/images/1.png"),
                              Text(
                                "FEATURED",
                                style: context.textTheme.bodyMedium!.copyWith(
                                  fontFamily: FontFamily.w500,
                                  color: const Color.fromARGB(
                                    219,
                                    255,
                                    255,
                                    255,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 50),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: SizedBox(
                              width: 200,
                              // height: 72,
                              child: Text(
                                "Take part in challenges with friends or other players",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodyLarge!.copyWith(
                                  fontFamily: FontFamily.w500,
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const SizedBox(width: 70),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: RoundedIconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        NavRoute.chooseCategory.path,
                                      );
                                    },
                                    label: "Create Room",
                                    color: context.colorScheme.onPrimary,
                                    image: ImageIcon(
                                      AssetImage(
                                        "assets/images/findfrienf_icon.png",
                                      ),
                                      color: context.colorScheme.secondary,
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset("assets/images/2.png"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Color(0xff9087E5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Get a coupon code",
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: context.colorScheme.onPrimary,
                              fontFamily: FontFamily.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(
                                            context,
                                          ).viewInsets.bottom,
                                    ),
                                    child: Container(
                                      height: 392,
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                        color: context.colorScheme.secondary,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              height: 150,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                                color: Color(0xff9087E5),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/images/invitebg.png",
                                                  ),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 27.0,
                                                      vertical: 30,
                                                    ),
                                                child: Column(
                                                  spacing: 6,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/avatar5.png",
                                                    ),
                                                    Text(
                                                      "Invite Friend",
                                                      style: context
                                                          .textTheme
                                                          .titleLarge!
                                                          .copyWith(
                                                            color:
                                                                context
                                                                    .colorScheme
                                                                    .onPrimary,
                                                            fontFamily:
                                                                FontFamily.w700,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            top: 130,
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/images/Union.png",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  24.0,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Invite friends and get a bonus points for every new player!",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: context
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            fontFamily:
                                                                FontFamily.w500,
                                                          ),
                                                    ),
                                                    const SizedBox(height: 24),
                                                    Container(
                                                      height: 56,
                                                      width:
                                                          MediaQuery.sizeOf(
                                                            context,
                                                          ).width,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              20,
                                                            ),
                                                        border: Border.all(
                                                          color: Color(
                                                            0xffbfd2f2,
                                                          ),
                                                        ),
                                                        color: Color(
                                                          0xffEFEEFC,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 16,
                                                            ),
                                                        child: Center(
                                                          child: TextFormField(
                                                            textAlign:
                                                                TextAlign
                                                                    .center,
                                                            style: context
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .w700,
                                                                ),
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .characters,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      20,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 24),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: PrimaryIconButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                context,
                                                              ).pop();
                                                            },
                                                            label: "Copy Code",
                                                            icon: Icon(
                                                              Icons
                                                                  .content_paste,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: Color(
                                                                0xffe1def9,
                                                              ),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10,
                                                                ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  12.0,
                                                                ),
                                                            child: Icon(
                                                              Icons
                                                                  .share_outlined,
                                                              color:
                                                                  context
                                                                      .colorScheme
                                                                      .secondary,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: context.colorScheme.secondary,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Join Room",
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    fontFamily: FontFamily.w500,
                                    color: context.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                color: context.colorScheme.onPrimary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Live Quizzes",
                          style: context.textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            fontFamily: FontFamily.w500,
                          ),
                        ),
                        PlainTextButton(
                          onPressed: () {},
                          label: 'See all',
                          color: context.colorScheme.secondary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        QuizCard(
                          imagePath: "assets/images/stats_frame.png",
                          title: "Statistics Math Quiz",
                          subject: "Math",
                          quizCount: "12 Quizzes",
                        ),
                        const SizedBox(height: 10),
                        QuizCard(
                          imagePath: "assets/images/integer_frame.png",
                          title: "Integer Math Quiz",
                          subject: "Math",
                          quizCount: "12 Quizzes",
                        ),
                        const SizedBox(height: 10),
                        QuizCard(
                          imagePath: "assets/images/maths_frame.png",
                          title: "Algebra Math Quiz",
                          subject: "Math",
                          quizCount: "12 Quizzes",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subject;
  final String quizCount;

  const QuizCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subject,
    required this.quizCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffefeefc)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imagePath),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: FontFamily.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        subject,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: FontFamily.w400,
                          color: const Color(0xff858494),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.circle,
                        color: Color(0xff858494),
                        size: 4,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        quizCount,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: const Color(0xff858494),
                          fontFamily: FontFamily.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}

class RecentQuizCard extends StatelessWidget {
  const RecentQuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xffffccd5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "RECENT QUIZ",
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: Color.fromARGB(176, 102, 0, 19),
                    fontFamily: FontFamily.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.headphones, color: Color(0xff660012)),
                    const SizedBox(width: 10),
                    Text(
                      "A Basic Music Quiz",
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontFamily: FontFamily.w700,
                        color: Color(0xff660012),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              width: 80,
              child: Center(
                child: Stack(
                  children: [
                    RadialFilledTrackProgress(
                      progress: 65,
                      size: 180,
                      fillGradientColors: [Color.fromARGB(255, 249, 125, 145)],
                    ),
                    Center(
                      child: Text(
                        "65%",
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontFamily: FontFamily.w700,
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadialFilledTrackProgress extends StatelessWidget {
  final double progress; // 0.0 to 100.0
  final double size;
  final Color backgroundColor;
  final List<Color> fillGradientColors;
  final Duration animationDuration;

  const RadialFilledTrackProgress({
    Key? key,
    required this.progress,
    this.size = 150.0,
    this.backgroundColor = const Color(0xFFFFB3C0),
    this.fillGradientColors = const [
      Color.fromARGB(255, 249, 125, 145),
      Color(0xffFFB3C0),
    ],
    this.animationDuration = const Duration(milliseconds: 800),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: progress),
      duration: animationDuration,
      builder: (context, animatedValue, _) {
        return SizedBox(
          height: size,
          width: size,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              // Background track
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showTicks: false,
                showLabels: false,
                startAngle: 270,
                endAngle: 630,
                radiusFactor: 0.9,
                axisLineStyle: AxisLineStyle(
                  thickness: 10.12,
                  color: backgroundColor,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
              ),
              // Foreground progress
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showTicks: false,
                showLabels: false,
                startAngle: 270,
                endAngle: 630,
                radiusFactor: 0.9,
                axisLineStyle: const AxisLineStyle(thickness: 0),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: animatedValue,
                    width: 10.12,
                    sizeUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.bothCurve,
                    gradient: SweepGradient(colors: fillGradientColors),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
