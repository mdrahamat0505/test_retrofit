import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logIn/bloc/login_bloc.dart';
import 'package:test_app/models/all_user_data.dart';
import 'package:test_app/widgets/custom_card.dart';
import 'package:test_app/widgets/custom_image.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.user,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Datum user;
  final void Function()? onTap;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, bool>(
      selector: (state) => (state.status != state.status),
      builder: (context, state) {
        return CustomCard(
          onTap: onTap,
          onLongPress: onLongPress,
          borderWidth: state ? 1 : null,
          margin: const EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 5,
              ),
              CustomImage(imageUrl: user.profilepicture ?? '', height: 60),
              const SizedBox(
                height: 9,
              ),
              Text(
                user.name ?? '',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  user.email ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  user.location ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 9),
            ],
          ),
        );
      },
    );
  }
}
