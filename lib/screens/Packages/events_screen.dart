import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/Packages/events_bloc.dart';
import '../../blocs/Packages/events_event.dart';
import '../../blocs/Packages/events_state.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_top_bar.dart';
import 'event_details_popup.dart'; // Ensure this import is correct

class EventScreen extends StatefulWidget {
  final bool showPopupOnLoad;
  const EventScreen({Key? key, this.showPopupOnLoad = false}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool _popupShown = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<EventBloc>().add(LoadEvents());
      context.read<EventBloc>().add(LoadAddressesEvent());
    });

    if (widget.showPopupOnLoad) {
      // Delay before showing the popup to allow the screen to render first
      Future.delayed(const Duration(milliseconds: 500), () {
        if (!_popupShown) {
          _popupShown = true;
          _showEventDetailPopup();
        }
      });
    }
  }

  void _showEventDetailPopup() {
    // Corrected to use showModalBottomSheet for bottom-up animation
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to take up more space
      backgroundColor: Colors.transparent,
      builder: (_) => const EventDetailsPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth < 900 ? 4 : 3;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomTopBar(
        onBack: () => Navigator.pop(context),
        onSearchChanged: (value) {
          print("Search typed: $value");
        },
        onCalendarTap: () {
          print("Calendar tapped");
        },
        onCartTap: () {
          print("Cart tapped");
        },
        onFavoriteTap: () {
          print("Favorite tapped");
        },
      ),
      body: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state.status == EventStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == EventStatus.failure) {
            return Center(child: Text(state.errorMessage ?? "Something went wrong."));
          } else if (state.status == EventStatus.success) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Events",
                      style: TextFontStyle.textFontStyle(18,const Color(0xFF575959),FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.events.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final event = state.events[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.Subcategory,
                              arguments: {
                                'eventName': event['name'],
                                'initialIndex': index,
                              },
                            );
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  event['image'] ?? '',
                                  width: MediaQuery.of(context).size.width * 80 / 375,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image_not_supported),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Flexible(
                                child: Text(
                                  event['name'] ?? '',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextFontStyle.textFontStyle(
                                      12, const Color(0xFF575959), FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}