import 'package:cinema_app/features/seat_selection/domain/entities/ticket_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/constants/app_constants.dart';
import '../../../../../core/utils/app_function.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/localizations.dart';

class AccountPaymentHistoryWidget extends StatefulWidget {
  final List<TicketEntity> tickets;
  final Function(String) onDelete;
  const AccountPaymentHistoryWidget({
    super.key,
    required this.tickets,
    required this.onDelete,
  });

  @override
  State<AccountPaymentHistoryWidget> createState() =>
      _AccountPaymentHistoryWidgetState();
}

class _AccountPaymentHistoryWidgetState
    extends State<AccountPaymentHistoryWidget> {
  late ThemeData _themeData;
  TextTheme get _textTheme => _themeData.textTheme;
  ColorScheme get _colorScheme => _themeData.colorScheme;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate(context).paymentHistory,
          style: _textTheme.titleMedium
              ?.copyWith(color: _colorScheme.primaryContainer),
        ),
        const SizedBox(
          height: 12,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildTicketItem(widget.tickets[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          },
          itemCount: widget.tickets.length,
        ),
        // Column(
        //   children: [
        //     _buildTicketItem(),
        //   ],
        // ),
      ],
    );
  }

  Container _buildTicketItem(TicketEntity ticket) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _colorScheme.outline,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                getImageUrl(ticket.movie?.posterUrl),
                width: 56,
                height: 88,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.movie?.title ?? '',
                  style: _textTheme.titleMedium,
                ),
                Text(
                  ticket.createdAt?.toLocalHHnnddmmyyWithCommas() ?? '',
                  style: _textTheme.bodyMedium,
                ),
                Text(
                  ticket.session?.theaterName ?? '',
                  style: _textTheme.bodyMedium
                      ?.copyWith(color: _colorScheme.primaryContainer),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (ticket.id != null) {
                widget.onDelete(ticket.id!);
              }
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
