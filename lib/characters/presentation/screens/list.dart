import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          context.read<CharacterListBloc>().add(Rendered());
        } else if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Success) {
          return ListView.builder(
            itemCount: state.characters.length,
            itemBuilder: (_, index) => CharacterCard(
              quote: state.characters[index],
            ),
          );
        } else if (state is Error) {
          return Center(
            child: Text(state.message),
          );
        }

        //return Text(AppLocalizations.of(context)!.helloWorld);
        return const SizedBox();
      },
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
