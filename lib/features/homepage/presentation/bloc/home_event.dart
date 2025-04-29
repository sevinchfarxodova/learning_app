abstract class HomeEvent {
  const HomeEvent();
}

// COURSES
class GetPopularCoursesEvent extends HomeEvent {
  final int limit;

  GetPopularCoursesEvent({required this.limit});
}

// MENTORS
class TopMentorsEvent extends HomeEvent {
  final int limit;

  TopMentorsEvent({required this.limit});
}

class MentorsEvent extends HomeEvent {
  final int limit;

 MentorsEvent({required this.limit});
}
