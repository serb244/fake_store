import 'package:fake_store/core/routes/app_router.dart';
import 'package:fake_store/features/user/app_drawer/presentation/widgets/drawer_admin_category_menu.dart';
import 'package:fake_store/features/user/app_drawer/presentation/widgets/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/di/injector.dart';
import '../../../../../core/routes/route_constants.dart';
import '../../../../auth/presentation/manager/auth_bloc.dart';
import '../widgets/category_list.dart';

class AppDrawer extends StatefulWidget {
  final bool isAdmin = true;

  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
         print("BlocConsumer AuthState: $state");
        },
        builder: (context, state) {
          return Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  DrawerHeader(
                    margin: EdgeInsets.zero,
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Row(
                      children: [
                        Text(
                          state.userModel != null   ?  'Hello ${state.userModel?.username}' :   'Hello guest',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                        TextButton(onPressed: () {
                      injector<AuthBloc>().state.authStatus == AuthStatus.unauthenticated ? context.goNamed(RouteConstants.authName)   : injector<AuthBloc>().add(AuthLogoutEvent());
                        }, child:  Text(injector<AuthBloc>().state.authStatus == AuthStatus.unauthenticated ?  'Sign in'  :  'Sign out'))
                      ],
                    ),
                  ),

                  state.userModel?.isAdmin  ?? false ? const DrawerAdminCategoryMenu() : const SizedBox.shrink(),
                  const AppDrawerCategoryList(),
                  const DrawerLanguageWidget(),
                  const ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('ExpansionTile 2'),
                    subtitle: Text('Custom expansion arrow icon'),
                    // trailing: Icon(
                    //   _customTileExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
                    // ),
                    children: <Widget>[
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('ExpansionTile 3'),
                    subtitle: Text('Leading expansion arrow icon'),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      ListTile(title: Text('This is tile number 3')),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
