import 'package:calculator_app/Constants/appcolors.dart';
import 'package:calculator_app/Provider/calculate_provider.dart';
import 'package:calculator_app/Provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: provider.isClick
            ? const Color(0Xff181f25)
            : const Color(0XFFFAF9F6),
        appBar: AppBar(
            backgroundColor: provider.isClick
                ? const Color(0Xff181f25)
                : const Color(0XFFFAF9F6),
            actions: [
              Icon(
                provider.isClick ? Icons.dark_mode : Icons.light_mode,
                size: 30,
                color: provider.isClick ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 8),

              Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: provider.isClick,
                  onChanged: (bool value) {
                    provider
                        .toggleTheme(); // Toggle the theme when the switch is toggled
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              )

              // IconButton(
              //   onPressed: () {
              //     // Get the ThemeProvider instance from the context
              //     final themeProvider =
              //         Provider.of<ThemeProvider>(context, listen: false);

              //     // Call the toggleTheme method to change the theme
              //     themeProvider.toggleTheme();
              //   },
              //   icon: Icon(
              //     // Use the isClick to determine the icon
              //     provider.isClick ? Icons.light_mode : Icons.dark_mode,
              //     size: 30,
              //   ),
              //   color: provider.isClick ? Colors.white : Colors.black,
              // )
            ]

            // title: const Text("appbar"),
            ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Consumer<CalculateProvider>(
              builder: (context, calculator, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // textDirection: TextDirection.rtl,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 500),
                      style: TextStyle(
                          fontSize: calculator.equalPressed
                              ? 25
                              : calculator.getLength
                                  ? 27
                                  : 35,
                          color: calculator.equalPressed
                              ? provider.isClick
                                  ? Colors.white60
                                  : Appcolors.acColor
                              : provider.isClick
                                  ? Colors.white
                                  : const Color(0xff3d3d3f),
                          fontWeight: calculator.equalPressed
                              ? FontWeight.normal
                              : FontWeight.bold),
                      child: Text(
                        calculator.input.isEmpty ? "0" : calculator.input,
                        // style: TextStyle(
                        //     fontSize: calculator.equalPressed
                        //         ? 25
                        //         : calculator.getLength
                        //             ? 27
                        //             : 35,
                        //     color: Appcolors.acColor,
                        //     fontWeight: calculator.equalPressed
                        //         ? FontWeight.normal
                        //         : FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 500),
                      style: TextStyle(
                          fontSize: calculator.equalPressed ? 35 : 25,
                          color: calculator.equalPressed
                              ? provider.isClick
                                  ? Colors.white
                                  : const Color(0xff3d3d3f)
                              : provider.isClick
                                  ? Colors.white60
                                  : Appcolors.acColor,
                          fontWeight: calculator.equalPressed
                              ? FontWeight.bold
                              : FontWeight.normal),
                      child: Text(
                        calculator.output,
                        // style: TextStyle(
                        //     fontSize: calculator.equalPressed ? 35 : 25,
                        //     color: Appcolors.acColor,
                        //     fontWeight: calculator.equalPressed
                        //         ? FontWeight.bold
                        //         : FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    scientificButton(
                      text: 'sin',
                    ),
                    scientificButton(
                      text: 'cos',
                    ),
                    scientificButton(
                      text: '(',
                    ),
                    scientificButton(
                      text: ')',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 62,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          calculator.setValue("AC");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: provider.isClick
                                ? const Color(0xff334a5a)
                                : Colors.white,
                            // fixedSize: const Size(70, 62),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Text(
                          "AC",
                          style: TextStyle(
                              fontSize: 16,
                              color: Appcolors.acColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 62,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          calculator.setValue("<");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: provider.isClick
                                ? const Color(0xff334a5a)
                                : Colors.white,
                            // fixedSize: const Size(70, 62),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Icon(
                          Icons.backspace_outlined,
                          color: Appcolors.acColor,
                        ),
                      ),
                    ),
                    customButton(
                        text: "/",
                        fgColor: Appcolors.textColor,
                        onPressed: () {
                          // print(text);
                        },
                        bgColor: provider.isClick
                            ? Appcolors.darkmodeColor
                            : Appcolors.opButtonColor,
                        height: 62,
                        width: 70),
                    customButton(
                        text: "*",
                        fgColor: Appcolors.textColor,
                        onPressed: () {},
                        bgColor: provider.isClick
                            ? Appcolors.darkmodeColor
                            : Appcolors.opButtonColor,
                        height: 62,
                        width: 70),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customButton(
                        text: "7",
                        fgColor: Appcolors.textColor,
                        onPressed: () {},
                        bgColor: provider.isClick
                            ? const Color(0xff303136)
                            : Appcolors.whiteColor,
                        height: 62,
                        width: 70),
                    customButton(
                        text: "8",
                        fgColor: Appcolors.textColor,
                        onPressed: () {},
                        bgColor: provider.isClick
                            ? const Color(0xff303136)
                            : Appcolors.whiteColor,
                        height: 62,
                        width: 70),
                    customButton(
                        text: "9",
                        fgColor: Appcolors.textColor,
                        onPressed: () {},
                        bgColor: provider.isClick
                            ? const Color(0xff303136)
                            : Appcolors.whiteColor,
                        height: 62,
                        width: 70),
                    customButton(
                        text: "-",
                        fgColor: Appcolors.textColor,
                        onPressed: () {},
                        bgColor: provider.isClick
                            ? Appcolors.darkmodeColor
                            : Appcolors.opButtonColor,
                        height: 62,
                        width: 70),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customButton(
                                text: "4",
                                fgColor: Appcolors.textColor,
                                onPressed: () {},
                                bgColor: provider.isClick
                                    ? const Color(0xff303136)
                                    : Appcolors.whiteColor,
                                height: 62,
                                width: 70,
                              ),
                              customButton(
                                  text: "5",
                                  fgColor: Appcolors.textColor,
                                  onPressed: () {},
                                  bgColor: provider.isClick
                                      ? const Color(0xff303136)
                                      : Appcolors.whiteColor,
                                  height: 62,
                                  width: 70),
                              customButton(
                                  text: "6",
                                  fgColor: Appcolors.textColor,
                                  onPressed: () {},
                                  bgColor: provider.isClick
                                      ? const Color(0xff303136)
                                      : Appcolors.whiteColor,
                                  height: 62,
                                  width: 70),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              customButton(
                                text: "1",
                                fgColor: Appcolors.textColor,
                                onPressed: () {},
                                bgColor: provider.isClick
                                    ? const Color(0xff303136)
                                    : Appcolors.whiteColor,
                                height: 62,
                                width: 70,
                              ),
                              customButton(
                                  text: "2",
                                  fgColor: Appcolors.textColor,
                                  onPressed: () {},
                                  bgColor: provider.isClick
                                      ? const Color(0xff303136)
                                      : Appcolors.whiteColor,
                                  height: 62,
                                  width: 70),
                              customButton(
                                  text: "3",
                                  fgColor: Appcolors.textColor,
                                  onPressed: () {},
                                  bgColor: provider.isClick
                                      ? const Color(0xff303136)
                                      : Appcolors.whiteColor,
                                  height: 62,
                                  width: 70),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customButton(
                                  text: "0",
                                  fgColor: Appcolors.textColor,
                                  onPressed: () {},
                                  bgColor: provider.isClick
                                      ? const Color(0xff303136)
                                      : Appcolors.whiteColor,
                                  height: 65,
                                  width: 150),
                              customButton(
                                  text: ".",
                                  fgColor: Appcolors.textColor,
                                  onPressed: () {},
                                  bgColor: provider.isClick
                                      ? const Color(0xff303136)
                                      : Appcolors.whiteColor,
                                  height: 65,
                                  width: 70),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        customButton(
                            text: "+",
                            fgColor: Appcolors.textColor,
                            onPressed: () {},
                            bgColor: provider.isClick
                                ? Appcolors.darkmodeColor
                                : Appcolors.opButtonColor,
                            height: 110,
                            width: 70),
                        const SizedBox(
                          height: 10,
                        ),
                        customButton(
                            text: "=",
                            fgColor: Appcolors.textColor,
                            onPressed: () {},
                            bgColor: provider.isClick
                                ? Appcolors.darkmodeColor
                                : Appcolors.opButtonColor,
                            height: 110,
                            width: 70),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }),
        ));
  }
}

// ignore: camel_case_types
class scientificButton extends StatelessWidget {
  final String text;
  const scientificButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculateProvider>(context);
    final provider = Provider.of<ThemeProvider>(context);

    return SizedBox(
      width: 70,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          calculator.setValue(text);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: provider.isClick
                ? const Color(0xff303136)
                : Appcolors.whiteColor),
        child: Text(
          text,
          style: TextStyle(
              color: Appcolors.textColor,
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class customButton extends StatelessWidget {
  final String text;
  final Color fgColor;
  final Color bgColor;
  final double height;
  final double width;

  final void Function()? onPressed;
  const customButton(
      {super.key,
      required this.text,
      required this.fgColor,
      required this.onPressed,
      required this.bgColor,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculateProvider>(context);
    return SizedBox(
      height: height,
      width: width,
child: ElevatedButton(
  onPressed: () {
    print(text);
    if (text != "=") {
      calculator.updateText(text);
    } else {
      calculator.setValue(text);
    }
  },
  style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))))
      .copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xffa0d7fe); // Color when pressed
        }
        return bgColor; // Default color
      },
    ),
  ),
  child: Text(
    "$text",
    style: TextStyle(fontSize: 30, color: fgColor),
  ),
),

    );
  }
}
