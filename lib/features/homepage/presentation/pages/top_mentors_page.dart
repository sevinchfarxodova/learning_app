import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../bloc/home_event.dart';
import '../bloc/mentors/mentors_bloc.dart';
import '../bloc/mentors/mentors_state.dart';
import '../widgets/mentors_list_widget.dart';
import '../widgets/notification_widget.dart';

class TopMentorsPage extends StatefulWidget {
  const TopMentorsPage({super.key});

  @override
  State<TopMentorsPage> createState() => _TopMentorsPageState();
}

class _TopMentorsPageState extends State<TopMentorsPage> {
  @override
  void initState() {
    super.initState();
    context.read<MentorBloc>().add(MentorsEvent(limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Top Mentors",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.search, size: 25.sp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<MentorBloc, MentorState>(
              builder: (context, state) {
                if (state is MentorLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is MentorLoaded) {
                  final mentors = state.mentors.results;
                  return ListView.builder(
                    itemCount: mentors.length,
                    itemBuilder: (BuildContext context, int index) {
                      final mentor = mentors[index];
                      return NotificationWidget(
                        title: mentor.fullName,
                        subtitle: mentor.expertiseDisplay,
                        imagePath: mentor.avatarUrl ?? 'null',
                      );
                    },
                  );
                } else if (state is MentorError) {
                  return Center(child: Text(state.message));
                }else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
