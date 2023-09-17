import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/api/constance.dart';
import '../../../data/data_source/api_services.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  String firstToken = '';
  Future<void> getAuthPayment() async {
    emit(PaymentAuthLoading());
    await DioHelper.postData(
      url: ApiUrl.baseUrl + ApiUrl.authTokenUrl,
      data: {
        "api_key": ApiUrl.apiKey,
      },
    ).then((value) {
      firstToken = value.data['token'];
      print('First Token $firstToken');
      emit(PaymentAuthSuccess());
    }).catchError((error) {
      emit(PaymentAuthFailure());
      print(error);
    });
  }

  int orderID = 0;
  String integrationIdCart = '';
  String finalToken = '';

  Future<void> getOrderId({
    required dynamic price,
  }) async {
    emit(GetOrderIdLoading());

    await DioHelper.postData(
      url: ApiUrl.baseUrl + ApiUrl.orderID,
      data: {
        "auth_token": firstToken,
        "delivery_needed": "false",
        "amount_cents": price.toString(),
        "currency": "EGP",
        "items": []
      },
    ).then((value) async {
      orderID = value.data['id'];
      getPaymentRequest(
        price: price,
      );

      print('Order $orderID');
      emit(GetOrderIdSuccess());
    }).catchError((error) {
      print(error);
      emit(GetOrderIdFailure());
    });
  }

  Future<void> getPaymentRequest({
    required String price,
  }) async {
    emit(GetPaymentRequestLoading());

    DioHelper.postData(
      url: ApiUrl.baseUrl + ApiUrl.paymentKeyRequest,
      data: {
        "auth_token": firstToken,
        "amount_cents": price,
        "expiration": 3600,
        "order_id": orderID,
        "billing_data": {
          "apartment": "NA",
          "email": "NA",
          "floor": "NA",
          "first_name": "NA",
          "street": "phone",
          "building": "NA",
          "phone_number": "NA",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "NA",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": ApiUrl.integrationId
      },
    ).then((value) {
      finalToken = value.data['token'];
      print('finalToken $finalToken');
      emit(GetPaymentRequestSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetPaymentRequestFailure());
    });
  }
}
