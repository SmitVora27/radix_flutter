import 'package:flutter/material.dart';
import 'package:flutter_radixweb/constant/images.dart';
import 'package:flutter_radixweb/constant/index.dart';

class UserItemView extends StatelessWidget {
  final Function? onCardPressed;
  final String? name;
  final String? email;
  final String? thumbnail;
  UserItemView({this.onCardPressed, this.name, this.email, this.thumbnail});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () {
      onCardPressed!();
    },
    child: Padding(
      padding: EdgeInsets.only(bottom: AppFontSize.value6),
      child: _buildJobCard(),
    ),
  );

  Card _buildJobCard() => Card(
    elevation: 3,
    shadowColor: AppColors.kBorderGrey.withOpacity(0.6),
    shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.all(Radius.circular(AppFontSize.value6))),
    child: Padding(
      padding: EdgeInsets.all(AppFontSize.value12),
      child: Row(
        children: [
          _buildThumbnail(),
          SizedBox(width: AppFontSize.value20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(right: AppFontSize.value24),
                        child: Text(
                          name ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.getH4SemiBoldBlackRegular(),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppFontSize.value6),
                  child: Text(
                        email ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.getH5BlackRegular()
                        .copyWith(fontSize: AppFontSize.value13),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildThumbnail() => Padding(
    padding: EdgeInsets.all(AppFontSize.value8),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppFontSize.value40),
        ),
      ),
      height: AppFontSize.value40,
      width: AppFontSize.value40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppFontSize.value4,
        ),
        child: (thumbnail != null &&
            thumbnail!.isNotEmpty)
            ? FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          image: thumbnail!,
          placeholder: Images.kProfilePlaceholder,
          height: AppFontSize.value40,
          width: AppFontSize.value40,
        )
            : Image.asset(
          Images.kProfilePlaceholder,
          height: AppFontSize.value40,
          width: AppFontSize.value40,
        ),
      ),
    ),
  );
}
