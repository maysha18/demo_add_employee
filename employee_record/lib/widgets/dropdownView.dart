// import 'package:employee_record/widgets/container_bg.dart';
// import 'package:employee_record/widgets/text_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class DropDownList<T> extends StatefulWidget {
//   List<dynamic> items;
//   double borderRadius;
//   Color dropdownColor;
//   Color iconColor;
//   String? dropDownText;
//   String hintText = "";
//   Color textcolor;
//   double? width;
//   final double? height;
//   double? fontSize;
//   final ValueChanged<dynamic> onChange;

//   DropDownList({
//     Key? key,
//     required this.borderRadius,
//     required this.dropdownColor,
//     required this.iconColor,
//     required this.onChange,
//     this.dropDownText,
//     required this.items,
//     required this.hintText,
//     required this.textcolor,
//     this.width,
//     this.height,
//     this.fontSize,
//   })  : assert(items != null),
//         super(key: key);

//   @override
//   _DropDownListState<T> createState() => _DropDownListState<T>();
// }

// class _DropDownListState<T> extends State<DropDownList<T>> {
//   final GlobalKey _key = GlobalKey();
//   final FocusNode _focusNode = FocusNode();
//   final LayerLink _layerLink = LayerLink();
//   bool _isHovered = false;
//   bool _isFocused = false;
//   bool _isOverlayShown = false;
//   OverlayEntry? _overlay;
//   FocusScopeNode? _focusScopeNode;
//   late Offset buttonPosition;
//   late Size buttonSize;

//   @override
//   void initState() {
//     super.initState();
//   }

//   findButton() {
//     RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
//     buttonSize = renderBox.size;
//     buttonPosition = renderBox.localToGlobal(Offset.zero);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: GestureDetector(
//         onTap: _onTap,
//         child: FocusableActionDetector(
//           focusNode: _focusNode,
//           mouseCursor: SystemMouseCursors.click,
//           actions: {
//             ActivateIntent: CallbackAction<Intent>(onInvoke: (_) => _onTap()),
//           },
//           onShowFocusHighlight: (isFocused) =>
//               setState(() => _isFocused = isFocused),
//           onShowHoverHighlight: (isHovered) =>
//               setState(() => _isHovered = isHovered),
//           child: ContainerBG(
//             key: _key,
//             padding: const EdgeInsets.all(10),
//             fillColor: Colors.white,
//             borderColor: Colors.grey,
//             borderWidth: 1,
//             radius: 5,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextView(
//                   text: widget.dropDownText ?? widget.hintText,
//                   fontWeight: FontWeight.w400,
//                   fontSize: widget.fontSize ?? 14,
//                 ),
//                 Spacer(),
//                 Icon(
//                   Icons.keyboard_arrow_down,
//                   color: widget.iconColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   _focusNode.dispose();
//   //   _focusScopeNode?.dispose();
//   // }

//   // OverlayEntry _createOverlay() {
//   //   _focusScopeNode = FocusScopeNode();
//   //   return OverlayEntry(
//   //     builder: (context) => GestureDetector(
//   //       behavior: HitTestBehavior.translucent,
//   //       onTap: _removeOverlay,
//   //       child: Stack(
//   //         alignment: AlignmentDirectional.center,
//   //         children: [
//   //           CompositedTransformFollower(
//   //             link: _layerLink,
//   //             showWhenUnlinked: false,
//   //             targetAnchor: Alignment.bottomRight,
//   //             followerAnchor: Alignment.topRight,
//   //             child: Material(
//   //               color: Colors.transparent,
//   //               child: FocusScope(
//   //                 node: _focusScopeNode,
//   //                 child: _createListItems(),
//   //                 onKey: (node, event) {
//   //                   if (event.logicalKey == LogicalKeyboardKey.escape) {
//   //                     _removeOverlay();
//   //                   }
//   //                   return KeyEventResult.ignored;
//   //                 },
//   //               ),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // void _removeOverlay() {
//   //   _overlay!.remove();
//   //   _isOverlayShown = false;
//   //   _focusScopeNode!.dispose();
//   //   FocusScope.of(context).nextFocus();
//   // }

//   // Widget _createListItems() {
//   //   return ContainerBG(
//   //     margin: EdgeInsets.only(
//   //       left: 20,
//   //     ),
//   //     padding: EdgeInsets.all(14),
//   //     height: widget.items.length * buttonSize.height + 10,
//   //     fillColor: widget.dropdownColor,
//   //     radius: widget.borderRadius,
//   //     child: ListView.builder(
//   //         padding: EdgeInsets.only(bottom: 80),
//   //         shrinkWrap: true,
//   //         itemCount: widget.items.length,
//   //         itemBuilder: (context, index) {
//   //           var items = widget.items;
//   //           return GestureDetector(
//   //             onTap: () {
//   //               _onListItemTap(items[index], index);
//   //             },
//   //             child: Container(
//   //                 width: buttonSize.width,
//   //                 height: buttonSize.height,
//   //                 child: TextView(
//   //                   text: items[index] is String
//   //                       ? items[index]
//   //                       : items[index].description,
//   //                   color: widget.textcolor,
//   //                 )),
//   //           );
//   //         }),
//   //   );
//   // }

//   // void _onTap() {
//   //   if (_isOverlayShown) {
//   //     _removeOverlay();
//   //   } else {
//   //     findButton();
//   //     _overlay = _createOverlay();
//   //     Overlay.of(context)?.insert(_overlay!);
//   //     _isOverlayShown = true;
//   //     FocusScope.of(context).setFirstFocus(_focusScopeNode!);
//   //   }
//   // }

//   // void _onListItemTap(dynamic listItem, int index) {
//   //   _removeOverlay();
//   //   widget.onChange(listItem is String ? index : listItem);
//   // }

// }
