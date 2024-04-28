// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/constants/assets.dart';
import '../../../../core/common/model/bloc_status_state.dart';
import '../../../../core/common/widget/customize_button.dart';
import '../../../../core/utils/double_utils.dart';
import '../../../../core/utils/localizations.dart';
import '../../../home/presentation/home_route.dart';
import '../../domain/entities/ticket_entity.dart';
import '../bloc/ticket_bloc.dart';
import '../bloc/ticket_event.dart';
import '../bloc/ticket_state.dart';

class TicketScreen extends StatefulWidget {
  final TicketEntity ticket;
  const TicketScreen({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;
  // late YoutubePlayerController youtubeController;

  TicketBloc get _bloc => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return BlocListener<TicketBloc, TicketState>(
      listener: (context, state) async {
        if (state.status == BlocStatusState.loading) {
          await EasyLoading.show();
        } else {
          await EasyLoading.dismiss();
          final _ = await showOkAlertDialog(
            context: context,
            title: translate(context).inform,
            message: state.message,
          );
          // Pop all (pop all)
          // Push Home => iniState => getMovie

          if (state.status == BlocStatusState.success) {
            await Navigator.pushNamedAndRemoveUntil(
              context,
              HomeRoute.screenName, // push new
              (Route<dynamic> route) => false, // pop to root
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(translate(context).payForTicket),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              color: _colorScheme.primaryContainer,
              size: 36,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: _colorScheme.surface,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.ticket.title ?? '--',
                      style: _textTheme.titleMedium?.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildSpecialInfoRow(context),
                    const SizedBox(
                      height: 8,
                    ),
                    _buildInfoRow(
                      context,
                      title: translate(context).date,
                      value: widget.ticket.time == null
                          ? '--'
                          : formatDate(
                              widget.ticket.time!,
                              [d, ' ', MM, ' ', yyyy, ', ', HH, ':', nn],
                            ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _buildInfoRow(
                      context,
                      title: translate(context).runtime,
                      value:
                          '${widget.ticket.runTime?.toStringAsFixed(0)} minutes',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _buildInfoRow(
                      context,
                      title: translate(context).seats,
                      value: widget.ticket.seats?.join(', ') ?? '--',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: _colorScheme.primaryContainer.withOpacity(0.5),
                      ),
                    ),
                    _buildInfoRow(
                      context,
                      title: widget.ticket.seats?.isNotEmpty == true
                          ? '''${widget.ticket.seats?.length} x ${translate(context).adult}'''
                          : '--',
                      value:
                          '${widget.ticket.seats?.length ?? 0} x ${(widget.ticket.unitPrice ?? 0).toVnd()}',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _buildInfoRow(
                      context,
                      title: translate(context).total,
                      value: ((widget.ticket.seats?.length ?? 0) *
                              (widget.ticket.unitPrice ?? 0))
                          .toDouble()
                          .toVnd(),
                      isBoldTitle: true,
                    ),
                  ],
                ),
              ),
              _buildTearLine(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomizedButton(
                        onTap: () async {
                          // final result = await showConfirmationDialog<String>(
                          //   context: context,
                          //   title: translate(context).confirm,
                          //   okLabel: 'Đồng ý',
                          //   cancelLabel: 'Hủy bỏ',
                          // );
                          final result = await showOkCancelAlertDialog(
                            context: context,
                            title: translate(context).inform,
                            message: translate(context)
                                .areYouSureYouWantToBuyThisTicket,
                            okLabel: translate(context).confirm,
                            cancelLabel: translate(context).cancel,
                          );
                          if (result == OkCancelResult.ok) {
                            _bloc.add(
                              CreateTicketEvent(ticket: widget.ticket),
                            );
                          }
                        },
                        text: translate(context).confirm,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTearLine() {
    return Row(
      children: [
        Expanded(
          child: SvgPicture.asset(
            Assets.svg.tearLine,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Row _buildSpecialInfoRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            translate(context).cinema,
            style: _textTheme.bodyMedium
                ?.copyWith(color: _colorScheme.primaryContainer),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.ticket.theater ?? '--'),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.ticket.filmFormat ?? '--',
              style: _textTheme.bodyMedium
                  ?.copyWith(color: _colorScheme.primaryContainer),
            ),
          ],
        ),
      ],
    );
  }

  Row _buildInfoRow(
    BuildContext context, {
    required String title,
    required String value,
    bool isBoldTitle = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            title,
            style: _textTheme.bodyMedium?.copyWith(
              color: _colorScheme.primaryContainer,
              fontWeight: isBoldTitle ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        Text(value),
      ],
    );
  }
}
