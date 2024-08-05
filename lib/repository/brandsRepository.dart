import 'package:clickshoppy/Helper/ApiBaseHelper.dart';
import 'package:clickshoppy/Helper/Constant.dart';
import 'package:clickshoppy/Helper/String.dart';
import 'package:clickshoppy/Model/brandModel.dart';

class BrandsRepository {
  Future<List<BrandData>> getAllBrands() async {
    try {
      var responseData = await ApiBaseHelper().postAPICall(getBrandsApi, {});
      return responseData['data']
          .map<BrandData>((e) => BrandData.fromJson(e))
          .toList();
    } on Exception catch (e) {
      throw ApiException('$errorMesaage${e.toString()}');
    }
  }
}
