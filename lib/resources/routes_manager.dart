import 'package:go_router/go_router.dart';
import 'package:news_app_pro/data/model/news_model.dart';
import 'package:news_app_pro/ui/screens/article_screen.dart';
import 'package:news_app_pro/ui/screens/home_screen.dart';
import 'package:news_app_pro/ui/screens/search_result_screen.dart';
import 'package:news_app_pro/ui/screens/search_screen.dart';

class Routes {
  static const String home = '/';
  static const String search = '/search';
  static const String searchResult = '/searchResult';
  static const String article = '/article';
}

class RoutesManager {
  static final GoRouter routeConfig = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Routes.search,
        builder: (context, state) {
          return const SearchScreen();
        },
      ),
      GoRoute(
        path: Routes.searchResult,
        builder: (context, state) {
          return SearchResultScreen(result: state.extra as List<Articles>?);
        },
      ),
      GoRoute(
        path: Routes.article,
        builder: (context, state) {
          return const ArticleScreen();
        },
      ),
    ],
  );
}
