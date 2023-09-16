part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentAuthLoading extends PaymentState {}

final class PaymentAuthSuccess extends PaymentState {}

final class PaymentAuthFailure extends PaymentState {}

final class GetOrderIdLoading extends PaymentState {}

final class GetOrderIdSuccess extends PaymentState {}

final class GetOrderIdFailure extends PaymentState {}

final class GetPaymentRequestLoading extends PaymentState {}

final class GetPaymentRequestSuccess extends PaymentState {}

final class GetPaymentRequestFailure extends PaymentState {}
