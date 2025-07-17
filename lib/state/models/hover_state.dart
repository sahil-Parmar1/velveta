///this part is for hoverdate that are usefull in hover

class HoverData {
  final bool isHovering;
  final String menuItem;

  HoverData({
    required this.isHovering,
    required this.menuItem,
  });

  HoverData copyWith({bool? isHovering, String? menuItem}) {
    return HoverData(
      isHovering: isHovering ?? this.isHovering,
      menuItem: menuItem ?? this.menuItem,
    );
  }
}
