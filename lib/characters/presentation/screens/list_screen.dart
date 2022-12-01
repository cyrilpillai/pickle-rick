import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../di/setup.dart';
import '../bloc/character_list_bloc.dart';
import '../bloc/character_list_event.dart';
import '../bloc/character_list_state.dart';
import '../widgets/character_card.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => injector<CharacterListBloc>(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pickle Rick'),
          ),
          body: const Content(),
          floatingActionButton: const ActionButton(),
        ));
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterListBloc, CharacterListState>(
      builder: (context, state) {
        if (state is Empty) {
          context.read<CharacterListBloc>().add(Initial());
        } else if (state is Loading) {
          return _buildLoading();
        } else if (state is Success) {
          return _buildSuccess(state);
          //return Text(AppLocalizations.of(context)!.helloWorld);
        } else if (state is Error) {
          return _buildError(state);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildLoading() {
    return SizedBox.expand(
      child: Container(
        color: Colors.white,
        child: Image.asset(
          "assets/images/loading.gif",
        ),
      ),
    );
  }

  Widget _buildSuccess(Success success) {
    return ListView.separated(
      itemCount: success.characters.length,
      itemBuilder: (_, index) => CharacterCard(
        characterItem: success.characters[index],
      ),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1,
        );
      },
    );
  }

  Widget _buildError(Error error) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(error.message),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.refresh),
      onPressed: () => context.read<CharacterListBloc>().add(RefreshClicked()),
    );
  }
}
