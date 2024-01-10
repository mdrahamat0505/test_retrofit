import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/di/interjection_service.dart';
import 'package:test_app/log_in/bloc/login_bloc.dart';
import 'package:test_app/network/api_client.dart';
import 'package:test_app/screens/user.dart';

class AllUserPage extends StatefulWidget {
  const AllUserPage({super.key});

  @override
  State<AllUserPage> createState() => _AllUserPageState();
}

class _AllUserPageState extends State<AllUserPage> {
  @override
  void initState() {
    context.read<LoginBloc>().add(GetLogin());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => current.status != previous.status,
        builder: (context, state) {
          if (state.users.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ListView.builder(
                  itemCount: state.users.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10,
                  ),
                  itemBuilder: (context, index) {
                    final item = state.users[index];
                    return UserItem(
                      user: item,
                      // onDoubleTap: () {
                      //   context.read<ProductBloc>().add(
                      //         SelectProduct(
                      //           idSelected: item.id ?? 0,
                      //         ),
                      //       );
                      // },
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.productDetails,
                        //   arguments: item.id,
                        // );
                      },
                      onLongPress: () {
                        //  showUpdateItem(item);
                      },
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(
                child: SizedBox(
              child: Text('User not found'),
            ));
          }
        },
      ),
    );
  }
}
