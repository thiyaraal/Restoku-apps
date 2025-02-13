// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/core/widgets/empty_content/empety_widget.dart';
import 'package:restoku_app/core/widgets/snackbar/top_snackbar.dart';
import 'package:restoku_app/features/order/view_models/add_review_provider.dart';
import 'package:restoku_app/features/order/view_models/detail_restaurant_provider.dart';
import 'package:restoku_app/features/order/views/widgets/form_review.dart';
import 'package:restoku_app/features/order/views/widgets/review_card.dart';

import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  final String restaurantId;
  const ReviewScreen({super.key, required this.restaurantId});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailRestaurantProvider>(context, listen: false)
          .fetchDetail(widget.restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<AddReviewProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: CustomDecorations.backgroundDecoration(context),
          padding: const EdgeInsets.all(20.0),
          child: Consumer<DetailRestaurantProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (provider.error != null) {
                return Center(child: Text(provider.error!));
              } else if (provider.detail?.restaurant == null) {
                return Center(child: BadNetworkWidget(
                  onTap: () {
                    Provider.of<DetailRestaurantProvider>(context,
                            listen: false)
                        .fetchDetail(widget.restaurantId);
                  },
                ));
              }

              final resto = provider.detail!.restaurant!;
              final reviews = resto.customerReviews ?? [];

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(TablerIcons.chevron_left),
                        color: Colors.white,
                      ),
                      Text(
                        resto.name ?? "Restaurant",
                        style: TextStyles.boldHeadlineMedium(context)?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ReviewFormWidget(
                    nameController: reviewProvider.nameController,
                    reviewController: reviewProvider.reviewController,
                    onSend: () async {
                      final success =
                          await reviewProvider.postReview(widget.restaurantId);

                      if (!mounted) {
                        return;
                      }

                      if (success) {
                        if (mounted) {
                          TopSnackBarWidget.showSuccessSnackBar(
                              context, "Review berhasil ditambahkan");
                        }

                        Future.delayed(const Duration(seconds: 2), () {
                          if (mounted) {
                            Provider.of<DetailRestaurantProvider>(context,
                                    listen: false)
                                .fetchDetail(widget.restaurantId);
                          }
                        });
                      } else {
                        if (mounted) {
                          TopSnackBarWidget.showErrorSnackBar(
                              context, "Gagal menambahkan review");
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    "All Reviews",
                    style: TextStyles.boldHeadlineSmall(context)?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: reviews.isEmpty
                        ? const Center(
                            child: Text(
                              "No reviews yet.",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : ListView.builder(
                            itemCount: reviews.length,
                            itemBuilder: (context, index) {
                              final review = reviews[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: ReviewCard(
                                  color:
                                      CustomDecorations.darkThemeColor(context),
                                  name: review.name ?? "Anonim",
                                  review: review.review ?? "No review provided",
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
