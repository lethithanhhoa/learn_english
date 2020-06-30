// This is a basic Flutter widget test.

// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learn_english/main.dart';
import 'package:learn_english/ui/modules/home/home_page.dart';
import 'package:learn_english/ui/provider/choice_button_state.dart';
import 'package:learn_english/ui/provider/index.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';

void main() {
  group('Index', () {
    test('value should start at 0', () {
      expect(Index().getIndex, 0);
    });

    test('value should be incremented', () {
      final index = Index();

      index.increment();

      expect(index.getIndex, 1);
    });

    test('value should be decremented', () {
      final index = Index();

      index.decrement();

      expect(index.getIndex, -1);
    });
  });

  group('Choice Buttons', () {
    test('value should start empty', () {
      expect(ChoiceButtonState().getValue, '');
    });

    test('value should be renew', () {
      final choiceButtonState = ChoiceButtonState();

      choiceButtonState.setValue('new Value');

      expect(choiceButtonState.getValue, 'new Value');
    });

    test('enable at the first button', () {
      final choiceButtonState = ChoiceButtonState();
      choiceButtonState.setClick(0, 'first');

      expect(choiceButtonState.getClicked(0), true);
    });

    test('value when clicking at the first button', () {
      final choiceButtonState = ChoiceButtonState();
      choiceButtonState.setClick(0, 'first');

      expect(choiceButtonState.getValue, 'first');
    });

    test('enable at the second button', () {
      final choiceButtonState = ChoiceButtonState();
      choiceButtonState.setClick(1, 'second');

      expect(choiceButtonState.getClicked(1), true);
    });

    test('value when clicking at the second button', () {
      final choiceButtonState = ChoiceButtonState();
      choiceButtonState.setClick(1, 'second');

      expect(choiceButtonState.getValue, 'second');
    });

    test('enable at the third button', () {
      final choiceButtonState = ChoiceButtonState();
      choiceButtonState.setClick(2, 'third');

      expect(choiceButtonState.getClicked(2), true);
    });

    test('value when clicking at the third button', () {
      final choiceButtonState = ChoiceButtonState();
      choiceButtonState.setClick(2, 'third');

      expect(choiceButtonState.getValue, 'third');
    });
  });

  group('Continue Button', () {
    test('name should be "Check It" when starting show the question', () {
      expect(ContinueButtonState().getNameButton, 'CHECK IT');
    });

    test('name should be "Continued" after clicked on itself', () {
      final continueButtonState = ContinueButtonState();

      continueButtonState.setNameToContinue();

      expect(continueButtonState.getNameButton, 'CONTINUE');
    });

    test('state should be disable when starting show the question', () {
      final continueButtonState = ContinueButtonState();

      expect(continueButtonState.getDisable, true);
    });

    test('state should be enabled when choosing the answer', () {
      final continueButtonState = ContinueButtonState();
      expect(continueButtonState.getDisable, true);
    });

    test('the number of correct answes should start at 0', () {
      final continueButtonState = ContinueButtonState();
      expect(continueButtonState.getCorrectAnswerNum, 0);
    });

  });
}
