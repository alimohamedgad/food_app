import 'package:flutter/material.dart';
import 'package:food_app/data/data_source/api_services.dart';

import '../../core/api/constance.dart';

class PaymentController extends ChangeNotifier {
  String firstToken = '';
  Future<void> getAuthPayment() async {
    await DioHelper.postData(
      url: ApiUrl.baseUrl + ApiUrl.authTokenUrl,
      data: {
        "api_key": ApiUrl.apiKey,
      },
    ).then((value) {
      firstToken = value.data['token'];
      print('First Token $firstToken');
      notifyListeners();
    }).catchError((error) {
      notifyListeners();
    });
  }

  int orderID = 0;
  String integrationIdCart = '';
  String finalToken = '';

  Future<void> getOrderId({
    required String name,
    required String email,
    required String phone,
    required String price,
  }) async {
    DioHelper.postData(
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
      await getPaymentRequest(
        name: name,
        email: email,
        phone: phone,
        price: price,
      );

      print('Order $orderID');
      notifyListeners();
    }).catchError((error) {
      print(error);
      notifyListeners();
    });
  }

  Future<void> getPaymentRequest({
    required String name,
    required String email,
    required String phone,
    required String price,
  }) async {
    DioHelper.postData(
      url: ApiUrl.baseUrl + ApiUrl.paymentKeyRequest,
      data: {
        "auth_token": firstToken,
        "amount_cents": price,
        "expiration": 3600,
        "order_id": orderID,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": name,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
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
      notifyListeners();
    }).catchError((error) {
      print(error.toString());
      notifyListeners();
    });
  }
}
