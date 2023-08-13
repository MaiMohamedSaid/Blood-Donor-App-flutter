// ignore_for_file: unnecessary_null_in_if_null_operators

class ErrorResponse {
  Errors? errors;
  String? error;
  String? message;

  ErrorResponse({
    this.errors,
    this.error,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
        error: json["error"] ?? null,
        message: json["message"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "errors": errors!.toJson(),
        "error": error,
        "message": message,
      };
}

class Errors {
  String? error;
  String? message;
  String? name;
  String? email;
  String? customerGroup;
  String? identity;
  String? password;
  String? phone;
  String? title;
  String? line1;
  String? lat;
  String? lng;
  String? state;
  String? country;
  String? city;
  String? address;
  String? customer;
  String? amountPaid;
  String? giftCardNo;
  String? sale;
  String? referenceNo;
  String? paidBy;
  String? totalCash;
  String? totalCheques;
  String? totalCcSlips;
  String? cashInHand;
  String? price;

  Errors({
    this.error,
    this.message,
    this.name,
    this.email,
    this.customerGroup,
    this.identity,
    this.password,
    this.phone,
    this.title,
    this.line1,
    this.lat,
    this.lng,
    this.state,
    this.country,
    this.address,
    this.city,
    this.customer,
    this.amountPaid,
    this.giftCardNo,
    this.sale,
    this.referenceNo,
    this.paidBy,
    this.totalCash,
    this.totalCheques,
    this.totalCcSlips,
    this.cashInHand,
    this.price,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        error: json["error"] ?? null,
        message: json["message"] ?? null,
        name: json["name"] ?? null,
        email: json["email"] ?? null,
        customerGroup: json["customer_group"] ?? null,
        identity: json["identity"] ?? null,
        password: json["password"] ?? null,
        phone: json["phone"] ?? null,
        title: json["title"] ?? null,
        line1: json["line1"] ?? null,
        lat: json["lat"] ?? null,
        lng: json["lng"] ?? null,
        state: json["state"] ?? null,
        country: json["country"] ?? null,
        address: json["address"] ?? null,
        city: json["city"] ?? null,
        customer: json["customer"] ?? null,
        amountPaid: json["amount_paid"] ?? null,
        giftCardNo: json["gift_card_no"] ?? null,
        sale: json["sale"] ?? null,
        referenceNo: json["reference_no"] ?? null,
        paidBy: json["paid_by"] ?? null,
        totalCash: json["total_cash"] ?? null,
        totalCheques: json["total_cheques"] ?? null,
        totalCcSlips: json["total_cc_slips"] ?? null,
        cashInHand: json["cash_in_hand"] ?? null,
        price: json["price"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "name": name,
        "email": email,
        "customer_group": customerGroup,
        "identity": identity,
        "password": password,
        "phone": phone,
        "title": title,
        "line1": line1,
        "lat": lat,
        "lng": lng,
        "state": state,
        "country": country,
        "address": address,
        "city": city,
        "customer": customer,
        "amount_paid": amountPaid,
        "gift_card_no": giftCardNo,
        "sale": sale,
        "reference_no": referenceNo,
        "paid_by": paidBy,
        "total_cash": totalCash,
        "total_cheques": totalCheques,
        "total_cc_slips": totalCcSlips,
        "cash_in_hand": cashInHand,
        "price": price,
      };
}
