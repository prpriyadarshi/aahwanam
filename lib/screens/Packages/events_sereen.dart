import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/Packages/events_bloc.dart';
import '../../blocs/Packages/events_event.dart';
import '../../blocs/Packages/events_state.dart';
import '../../widgets/events_card.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EventBloc()..add(LoadEvents()),
      child: Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search here...',
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/cart.png', width: 24, height: 24),
                    const SizedBox(width: 10),
                    const Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ),
            ),
          ),
          body: BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state is EventLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is EventLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Events',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: GridView.builder(
                          itemCount: state.events.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            final event = state.events[index];
                            return EventCard(
                              title: event['name']!,
                              imagePath: event['image']!,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is EventError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox.shrink();
            },
          ),
          
        );
      },
    ),
    );
  }
}
