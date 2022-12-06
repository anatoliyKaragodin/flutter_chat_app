﻿part of '../asap_page.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      this.name,
      this.image,
      this.message,
      this.onTap,
      this.selected});

  final String? name;
  final String? image;
  final String? message;
  final Function()? onTap;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      // selected: true,
      selectedTileColor: AppColor.color9E9E9E.withOpacity(0.4),
      selectedColor: AppColor.color000000,
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          image ?? '',
          scale: 2,
        ),
      ),
      title: Text(
        name ?? '',
        style: AppTextStyle.s17Abel,
      ),
      subtitle: Text(
        message ?? '',
        style: AppTextStyle.s14AbelGrey,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}