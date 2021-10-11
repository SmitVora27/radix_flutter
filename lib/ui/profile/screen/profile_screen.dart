import 'package:flutter/material.dart';
import 'package:flutter_radixweb/constant/images.dart';
import 'package:flutter_radixweb/constant/index.dart';
import 'package:flutter_radixweb/constant/shared_preference_helper.dart';
import 'package:flutter_radixweb/ui/home/model/profile_model.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileModel? profileModel;
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async{
    var data = await sharedPreferenceHelper.read("userData");
    profileModel = ProfileModel.fromJSON(data);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                leading: SizedBox(),
                title: Text(RadixStrings.screenTitle.kMyProfile),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                    ),
                    onPressed: () {

                    },
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTitleRow(),
                        _buildBoxForLocationInfo(),
                        _buildDivider(),
                      ],
                    ),
                  ),
                ],
              ),
            );
  }

  Widget _buildTitleRow() => Padding(
    padding: EdgeInsets.symmetric(
        horizontal: AppFontSize.value18, vertical: AppFontSize.value16),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppFontSize.value8,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: AppFontSize.value8,
                bottom: AppFontSize.value14,
                right: AppFontSize.value14,
                left: AppFontSize.value14),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppFontSize.value12),
                ),
              ),
              height: AppFontSize.value100,
              width: AppFontSize.value100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppFontSize.value12,
                ),
                child: (profileModel?.profileImage != null &&
                    profileModel!.profileImage!.isNotEmpty)
                    ? FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  image: profileModel!.profileImage!,
                  placeholder: Images.kProfilePlaceholder,
                  height: AppFontSize.value100,
                  width: AppFontSize.value100,
                )
                    : Image.asset(
                  Images.kProfilePlaceholder,
                  height: AppFontSize.value100,
                  width: AppFontSize.value100,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(AppFontSize.value4),
          child: Text(
            profileModel?.name ?? "",
            style: TextStyles.getH3SemiBoldBlackRegular(),
          ),
        ),
      ],
    ),
  );

  Widget _buildBoxForLocationInfo() => Padding(
    padding: EdgeInsets.symmetric(horizontal: AppFontSize.value16, vertical: AppFontSize.value12),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppFontSize.value6),
          border: Border.all(
              color: AppColors.kBoxBorder, width: AppFontSize.value1)),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBoxItems(
                      icon: Icons.email,
                      title: profileModel?.email ?? "",
                      type: RadixStrings.label.kEmail)
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget _buildDivider() => Container(
      height: AppFontSize.value2,
      child: Divider(
        color: AppColors.kBoxBorder,
      ));

  Widget _buildBoxItems(
      {required String title,
        required String type,
        IconData? icon,
        String? image}) =>
      Padding(
        padding: EdgeInsets.all(AppFontSize.value14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon != null
                ? Padding(
              padding: EdgeInsets.only(top: AppFontSize.value2),
              child: Icon(
                icon,
                size: AppFontSize.value20,
                color: AppColors.kButtonBackground,
              ),
            )
                : Padding(
              padding: EdgeInsets.only(top: AppFontSize.value2),
              child: Image(
                image: AssetImage(image ?? Images.kProfilePlaceholder),
                height: AppFontSize.value18,
                width: AppFontSize.value20,
              ),
            ),
            SizedBox(
              width: AppFontSize.value8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyles.getH5SemiBoldBlackRegular()
                        .copyWith(fontSize: AppFontSize.value15)),
                Text(type,
                    style: TextStyles.getH6MediumBlackRegular()
                        .copyWith(color: AppColors.kGrey))
              ],
            )
          ],
        ),
      );
}
