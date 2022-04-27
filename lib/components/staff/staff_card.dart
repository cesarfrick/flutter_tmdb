import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';

class StaffCard extends StatelessWidget {
  StaffCard({
    Key? key,
    this.imgSrc,
    required this.name,
    required this.role,
  }) : super(key: key);

  final String? imgSrc;
  final String name;
  final String role;

  final String baseUrl = GlobalConfigs().get('api.images.secure_base_url');
  final String imgSize = GlobalConfigs().get('api.images.profile_sizes')[1];
  final String defaultImg = 'assets/images/default_profile.png';
  final BoxFit fitValue = BoxFit.cover;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          fit: StackFit.passthrough,
          alignment: AlignmentDirectional.topCenter,
          children: [
            SizedBox(
              height: 150,
              width: 180,
              child: GestureDetector(
                child: imgSrc == null
                    ? Image.asset(
                        defaultImg,
                        fit: fitValue,
                      )
                    : Image.network(
                        '$baseUrl$imgSize$imgSrc',
                        fit: fitValue,
                      ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: DecoratedBox(
                decoration: const BoxDecoration(color: Colors.white),
                child: SizedBox(
                  width: 180,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Column(
                      children: [
                        Text(name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text(role),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
