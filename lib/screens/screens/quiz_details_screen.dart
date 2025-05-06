import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queezy/common/common.dart';
import 'package:queezy/screens/cubit/create_room_cubit.dart';
import 'package:queezy/screens/cubit/queezy_list_cubit.dart';
import 'package:queezy/routes/routes.dart';
import 'package:queezy/screens/models/create_room_model.dart';
import 'package:queezy/screens/widget/async_widget.dart';

class QuizDetailsScreen extends StatefulWidget {
  const QuizDetailsScreen({super.key, this.roomDetail});
  final Map<String, dynamic>? roomDetail;

  @override
  State<QuizDetailsScreen> createState() => _QuizDetailsScreenState();
}

class _QuizDetailsScreenState extends State<QuizDetailsScreen> {
  List<Player>? allPlayers = [];

  // @override
  // void initState() {
  //   getIt<SocketService>().on("player_joined", (data) {
  //     print(data);
  //     final roomModel = CreateRoomModel.fromJson(data);
  //     setState(() {
  //       this.roomModel = roomModel;
  //     });
  //   });
  //   super.initState();
  // }
  //   @override
  // void initState() {
  //   super.initState();
  //   players = [];

  //   getIt<SocketService>().on("player_joined", (data) {
  //     print(data);
  //     final newPlayer = Player.fromJson(data);
  //     setState(() {
  //       if (roomModel != null && roomModel!.data != null) {
  //         roomModel!.data!.players?.add(newPlayer);
  //       } else {
  //         roomModel = CreateRoomModel(data: Data(players: [newPlayer]));
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                final code = widget.roomDetail?['roomCode'];
                Navigator.pushNamed(
                  context,
                  NavRoute.inviteFriend.path,
                  arguments: code,
                );
              },
              child: Icon(
                Icons.share_outlined,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
      body: AsyncWidget<CreateRoomCubit, CreateRoomModel>(
        data: (room) {
          final roomData = room?.data;
          allPlayers = [
            ...?roomData?.players,
            if (roomData?.player != null) roomData!.player!,
          ];
          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Image.asset(
                    "assets/images/Illustration.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: context.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.roomDetail?['category']['name'],
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.onSecondary,
                              fontFamily: FontFamily.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Basic Trivia Quiz",
                            style: context.textTheme.headlineMedium!.copyWith(
                              fontFamily: FontFamily.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: context.colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: context.colorScheme.secondary,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.question_mark,
                                        color: context.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${roomData?.type}",
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(fontFamily: FontFamily.w500),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    height: 40,
                                    width: 2,
                                    color: Colors.grey.shade300,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: context.colorScheme.onTertiary,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.extension_outlined,
                                        color: context.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${roomData?.difficulty}",
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(fontFamily: FontFamily.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Description",
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.onSecondary,
                              fontFamily: FontFamily.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.roomDetail!['category']['description'],
                            style: context.textTheme.bodyLarge!.copyWith(
                              fontFamily: FontFamily.w400,
                            ),
                          ),
                          const SizedBox(height: 18),
                          if (allPlayers != null)
                            Expanded(
                              child: ListView.separated(
                                itemCount: allPlayers!.length,
                                itemBuilder: (context, index) {
                                  final player =
                                     roomData?.players?[index];
                                  if (index == 0) {
                                    return Row(
                                      children: [
                                        Image.network(
                                          "${roomData?.player?.avatar}",
                                          scale: 3,
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${roomData?.player?.name}",
                                              style: context
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontFamily: FontFamily.w500,
                                                  ),
                                            ),
                                            Text(
                                              roomData?.player?.isHost == true
                                                  ? "Creator"
                                                  : "Joiner",
                                              style: context
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontFamily: FontFamily.w400,
                                                    color: Colors.grey,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }
                                  return Row(
                                    children: [
                                      Image.network(
                                        "$baseUrl${player?.avatar}",
                                        scale: 3,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${player?.name}",
                                            style: context.textTheme.bodyMedium!
                                                .copyWith(
                                                  fontFamily: FontFamily.w500,
                                                ),
                                          ),
                                          Text(
                                            player?.isHost == true
                                                ? "Creator"
                                                : "Joiner",
                                            style: context.textTheme.bodySmall!
                                                .copyWith(
                                                  fontFamily: FontFamily.w400,
                                                  color: Colors.grey,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  return const SizedBox(height: 10);
                                },
                              ),
                            ),
                          if (roomData == null) Expanded(child: SizedBox()),
                          const SizedBox(height: 20),
                          Row(
                            spacing: 8,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                      MediaQuery.sizeOf(context).width,
                                      50,
                                    ),
                                    backgroundColor:
                                        context.colorScheme.onPrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: context.colorScheme.onSecondary,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    context.read<QueezyListCubit>().getquestion(
                                      difficulity:roomData?.difficulty,
                                      type: roomData?.type,
                                      category:
                                          roomData?.categoryId,
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      NavRoute.quizScreen.path,
                                      arguments: {
                                        "category":
                                            widget
                                                .roomDetail?['category']['category'],
                                        "players":
                                            allPlayers?.length,
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Play Solo",
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(
                                          color: context.colorScheme.secondary,
                                          fontFamily: FontFamily.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                      MediaQuery.sizeOf(context).width,
                                      50,
                                    ),
                                    backgroundColor:
                                        context.colorScheme.secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: context.colorScheme.onSecondary,
                                      ),
                                    ),
                                  ),

                                  onPressed: () {
                                    context.read<QueezyListCubit>().getquestion(
                                      difficulity:
                                          roomData?.difficulty,
                                      category:
                                          roomData?.categoryId,
                                      type: roomData?.type,
                                      roomcode:roomData?.roomCode,
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      NavRoute.quizScreen.path,
                                      arguments:
                                          widget
                                              .roomDetail?['category']['category'],
                                    );
                                  },
                                  child: Text(
                                    "Play with Friends",
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(
                                          color: context.colorScheme.onPrimary,
                                          fontFamily: FontFamily.w500,
                                        ),
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
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
