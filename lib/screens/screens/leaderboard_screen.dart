import 'package:flutter/material.dart';
import 'package:queezy/common/common.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leaderboard",
          style: context.textTheme.headlineMedium!.copyWith(
            fontFamily: FontFamily.w500,
            color: context.colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 24,
            right: 24,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffFFB380),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFF9B57),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    child: Text(
                      "#4",
                      style: context.textTheme.headlineSmall!.copyWith(
                        color: context.colorScheme.onPrimary,
                        fontFamily: FontFamily.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'You are doing better than 60% of other players!',
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontFamily: FontFamily.w500,
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildPodiumUser(
                        image: "assets/images/avatar1.png",
                        name: "Alena Donin",
                        points: "1,469 QP",
                        rankImage: "assets/images/Rank2.png",
                        topPadding: 35,
                      ),
                      _buildPodiumUser(
                        image: "assets/images/avatar8.png",
                        name: "Davis Curtis",
                        points: "2,569 QP",
                        rankImage: "assets/images/Rank1.png",
                        topPadding: 20,
                      ),
                      _buildPodiumUser(
                        image: "assets/images/avatar9.png",
                        name: "Craig Gouse",
                        points: "2,569 QP",
                        rankImage: "assets/images/Rank3.png",
                        topPadding: 98,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.36,
            minChildSize: 0.25,
            maxChildSize: 1.0,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Center(child: Image.asset("assets/images/Slice 1.png")),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 5),
                        decoration: const BoxDecoration(
                          color: Color(0xffEFEEFC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.separated(
                            controller: scrollController,
                            itemCount: 10,
                            itemBuilder:
                                (context, index) {
                                  final nextIndex =  index + 3 ;
                                  return PlayerCard(index: nextIndex);
                                },
                            separatorBuilder:
                                (_, __) => const SizedBox(height: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPodiumUser({
    required String image,
    required String name,
    required String points,
    required String rankImage,
    required double topPadding,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        children: [
          Image.asset(image),
          const SizedBox(height: 16),
          Text(
            name,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.w500,
              color: context.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff9087E5),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              points,
              style: context.textTheme.bodySmall!.copyWith(
                fontFamily: FontFamily.w500,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(rankImage),
        ],
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colorScheme.onPrimary,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffE6E6E6)),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
            child: Text(
              "${index + 1}",
              style: context.textTheme.bodySmall!.copyWith(
                color: const Color(0xff858494),
                fontFamily: FontFamily.w500,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Image.asset("assets/images/avatar12.png"),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Davis Cutris",
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontFamily: FontFamily.w500,
                  ),
                ),
                Text(
                  "2,569 points",
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontFamily: FontFamily.w400,
                    color: const Color(0xff858494),
                  ),
                ),
              ],
            ),
          ),
          if (index == 0)
            Image.asset("assets/images/gold_badge.png")
          else if (index == 1)
            Image.asset("assets/images/silver_badge.png")
          else if (index == 2)
            Image.asset("assets/images/bronze_badge.png")
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
