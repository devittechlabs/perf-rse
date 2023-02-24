import 'package:go_router/go_router.dart';
import '../view/common/login_page/login_page.dart';

class RouteClass {
  static final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context,state){
            return const LoginPage();
          }
        ),
      ]
  );
}
