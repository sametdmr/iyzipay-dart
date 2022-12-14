import 'package:iyzipay/iyzipay.dart';
import 'package:test/test.dart';

import '../../config.dart';

void main() {
  /// Note: [TestConfig] has been ignored by git, so you need your own,
  /// or just put the values
  final iyzipay = Iyzipay(
    options: IyzipayOptions(
      baseUrl: TestConfig.baseUrl,
      apiKey: TestConfig.apiKey,
      secretKey: TestConfig.secretKey,
    ),
  );
  group('Bkm Test -', () {
    var token = '';

    test('bkm initialize test', () async {
      final response = await iyzipay.bkm.initialize(
        request: InitializeBkmRequest(
          locale: IyzipayLocale.tr.value,
          conversationId: '123456789',
          price: Utils.formatPrice('1') ?? '1.0',
          basketId: 'B67832',
          paymentGroup: PaymentGroup.product,
          callbackUrl: 'https://www.merchant.com/callback',
          enabledInstallments: [2, 3, 6, 9],
          buyer: const Buyer(
            id: 'BY789',
            name: 'John',
            surname: 'Doe',
            gsmNumber: '+905350000000',
            email: 'email@email.com',
            identityNumber: '74300864791',
            lastLoginDate: '2015-10-05 12:43:35',
            registrationDate: '2013-04-21 15:12:09',
            registrationAddress: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
            ip: '85.34.78.112',
            city: 'Istanbul',
            country: 'Turkey',
            zipCode: '34732',
          ),
          shippingAddress: const Address(
            contactName: 'Jane Doe',
            city: 'Istanbul',
            country: 'Turkey',
            address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
            zipCode: '34742',
          ),
          billingAddress: const Address(
            contactName: 'Jane Doe',
            city: 'Istanbul',
            country: 'Turkey',
            address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
            zipCode: '34742',
          ),
          basketItems: [
            const BasketItem(
              id: 'BI101',
              name: 'Binocular',
              category1: 'Collectibles',
              category2: 'Accessories',
              itemType: BasketItemType.physical,
              price: '0.3',
            ),
            const BasketItem(
              id: 'BI102',
              name: 'Game code',
              category1: 'Game',
              category2: 'Online Game Items',
              itemType: BasketItemType.virtual,
              price: '0.5',
            ),
            const BasketItem(
              id: 'BI103',
              name: 'Usb',
              category1: 'Electronics',
              category2: 'Usb / Cable',
              itemType: BasketItemType.physical,
              price: '0.2',
            ),
          ],
        ),
      );

      token = response?.token ?? '';

      // ignore: avoid_print
      // print(response?.errorMessage);

      expect(response?.status, IyzipayStatus.success);
      expect(response?.locale, IyzipayLocale.tr);
      expect(response?.systemTime, isNotNull);
      expect(response?.conversationId, isNotNull);
      expect(response?.htmlContent, isNotNull);
      expect(response?.token, isNotNull);
    });
  });
}
