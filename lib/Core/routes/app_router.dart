import 'package:go_router/go_router.dart';
import 'package:to_dolist_app/Features/Category/Presentation/views/CategoryScreenView.dart';
import 'package:to_dolist_app/Features/TaskDate/today.dart';
import 'package:to_dolist_app/Features/TaskDate/Upcoming.dart';
import '../../Features/HomeScreen/Presentation/views/HomeScreenView.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  HomeScreenView(),
    ),
    GoRoute(path: '/CategoryScreenView/:i', builder: (context, state) =>  CategoryScreenView(
        i: int.parse(state.pathParameters['i']!),
    )
    ),
    GoRoute(path: '/Today', builder: (context, state) =>  Today(),),
    GoRoute(path: '/Upcoming', builder: (context, state) =>  UpComing(),)
  ],
);