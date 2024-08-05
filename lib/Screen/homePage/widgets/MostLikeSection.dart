import 'package:clickshoppy/Helper/Color.dart';
import 'package:clickshoppy/Model/Section_Model.dart';
import 'package:clickshoppy/Provider/ProductProvider.dart';
import 'package:clickshoppy/Provider/homePageProvider.dart';
import 'package:clickshoppy/Screen/homePage/widgets/section.dart';
import 'package:clickshoppy/Screen/Language/languageSettings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Helper/String.dart';

class MostLikeSection extends StatelessWidget {
  final String SysCurrency;

  const MostLikeSection({
    required this.SysCurrency,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageProvider, bool>(
      builder: (context, data, child) {
        return data
            ? SizedBox(
                width: double.infinity,
                child: Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.simmerBase,
                  highlightColor: Theme.of(context).colorScheme.simmerHigh,
                  child: Section.sectionLoadingShimmer(context),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Selector<ProductProvider, List<Product>>(
                  builder: (context, mostLikeProductsList, child) {
                    return mostLikeProductsList.isNotEmpty
                        ? SingleSection(
                            index: 0,
                            productList: mostLikeProductsList,
                            from: 2,
                            sectionTitle:
                                getTranslated(context, 'You might also like'),
                            sectionSubTitle: getTranslated(
                                context, 'We have products which you like'),
                            sectionStyle: DEFAULT,
                            wantToShowOfferImageBelowSection: false,
                            SysCurrency: SysCurrency,
                          )
                        : const SizedBox();
                  },
                  selector: (_, provider) => provider.productList,
                ),
              );
      },
      selector: (_, HomePageProvider) => HomePageProvider.mostLikeLoading,
    );
  }
}
