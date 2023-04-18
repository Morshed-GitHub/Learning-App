import 'package:flutter/material.dart';
import 'package:learning_app/pages/central.dart';
import 'package:learning_app/pages/home.dart';
import 'package:learning_app/provider/choice_chip_provider.dart';
import 'package:learning_app/widgets/navigator_button.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/appBar.dart';

class LevelQuery extends StatelessWidget {
  const LevelQuery({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChoiceChipProvider>(context, listen: false);

    void validateThenNavigate() {
      provider.checkIfLevelNotSelected()
          ? Utils.toastMessage("Please choose the level first")
          : provider.checkIfSelectionBoxNotSelected()
              ? Utils.toastMessage("Please select the checkbox first")
              : Utils.navigatePushReplaceToPage(context, const CentralPage());
    }

    return Scaffold(
      appBar: LearningAppBar(title: "", isBackButtonEnabled: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        children: [
          learningAppText(),
          const SizedBox(height: 25),
          Image.asset("assets/images/level.jpeg"),
          const SizedBox(height: 20),
          courseLevelQueryText(),
          const SizedBox(height: 20),
          const OptionsButton(),
          const SizedBox(height: 20),
          const AskingSurityCheckBox(),
          const SizedBox(height: 20),
          NavigatorButton(
              func: () {
                validateThenNavigate();
              },
              action: "Continue")
        ],
      ),
    );
  }

  Text courseLevelQueryText() {
    return Text(
      "Select your course level",
      style: TextStyle(
        color: Utils.splashColor,
        fontSize: 22,
      ),
    );
  }

  Widget learningAppText() {
    return Center(
      child: Text(
        "Learning App",
        style: TextStyle(
          color: Utils.splashColor,
          fontSize: 35,
        ),
      ),
    );
  }
}

class AskingSurityCheckBox extends StatelessWidget {
  const AskingSurityCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChoiceChipProvider>(
      builder: (context, provider, child) => CheckboxListTile(
        title: Text(
          'Are you sure?',
          style:
              TextStyle(color: Utils.splashColor, fontWeight: FontWeight.w500),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: provider.isChecked,
        activeColor: Utils.splashColor,
        checkColor: Colors.white,
        onChanged: (value) {
          provider.toggleCheckBoxSelection(value);
        },
      ),
    );
  }
}

class OptionsButton extends StatelessWidget {
  const OptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle selectedLabelStyle = const TextStyle(color: Colors.white);
    final chipProvider =
        Provider.of<ChoiceChipProvider>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(
        chipProvider.options.length,
        (int index) {
          return Consumer<ChoiceChipProvider>(
            builder: (context, value, child) => ChoiceChip(
              label: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(value.options[index],

                    // Chips Text Color....
                    style: value.checkIndex(index: index)
                        ? selectedLabelStyle // Selected -> White
                        : TextStyle(
                            color: Theme.of(context)
                                .chipTheme
                                .selectedColor) // Un-Selected -> Utils.splashColor
                    ),
              ),
              selected: value.checkIndex(index: index),
              onSelected: (bool selected) {
                value.toggleChoiceChipSelection(
                    selected: selected, index: index);
              },
            ),
          );
        },
      ).toList(),
    );
  }
}
