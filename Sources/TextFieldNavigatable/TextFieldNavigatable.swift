//
//  TextFieldNavigatable.swift
//
//  Created by Prathamesh Kowarkar on 03/12/19.
//  Copyright © 2019 Prathamesh Kowarkar. All rights reserved.
//

import UIKit

public protocol TextFieldNavigatable: UIViewController {

    func addToolbar(
        to textFields: UITextField?...,
        isNavigatable: Bool,
        isDismissable: Bool
    )

}

public extension TextFieldNavigatable {

    ///
    /// Adds a toolbar with next and previous button to a provided ordered list of text fields.
    ///
    /// - Parameters:
    ///   - textFields: An ordered list of text fields to add the toolbar to.
    ///   - isNavigatable: A flag that dictates whether to add previous and next buttons.
    ///   - isDismissable: A flag that dictates whether to add a **Done** button.
    ///   - nextButtonText: Text for the Next button. Defaults to "Next".
    ///   - previousButtonText: Text for the Previous button. Defaults to "Previous"
    ///
    func addToolbar(
        to textFields: UITextField?...,
        isNavigatable: Bool = true,
        isDismissable: Bool = true,
        nextButtonText: String = "Next",
        previousButtonText: String = "Previous"
    ) {



        let textFields = textFields.compactMap({ $0 })

        for (index, textField) in textFields.enumerated()
        {
            let toolbar: UIToolbar = UIToolbar()
            toolbar.sizeToFit()

            var items = [UIBarButtonItem]()

            if isNavigatable {
                items.append(previousButton(for: textField, at: index, in: textFields, previousButtonText: previousButtonText))
                items.append(nextButton(for: textField, at: index, in: textFields, nextButtonText: nextButtonText))
            }

            items.append(flexibleSpace)

            if isDismissable {
                items.append(doneButton)
            }

            toolbar.items = items
            textField.inputAccessoryView = toolbar
        }
    }

    private func previousButton(
        for textField: UITextField,
        at index: Int,
        in textFields: [UITextField],
        previousButtonText: String
    ) -> UIBarButtonItem {
        let button = UIBarButtonItem(
            title: previousButtonText,
            style: .plain,
            target: nil,
            action: nil
        )
        button.width = 44
        if textField == textFields.first {
            button.isEnabled = false
        } else {
            button.target = textFields[index - 1]
            button.action = #selector(UITextField.becomeFirstResponder)
        }
        return button
    }

    private func nextButton(
        for textField: UITextField,
        at index: Int,
        in textFields: [UITextField],
        nextButtonText: String
    ) -> UIBarButtonItem {
        let button = UIBarButtonItem(
            title: nextButtonText,
            style: .plain,
            target: nil,
            action: nil
        )
        button.width = 44
        if textField == textFields.last {
            button.isEnabled = false
        } else {
            button.target = textFields[index + 1]
            button.action = #selector(UITextField.becomeFirstResponder)
        }
        return button
    }

    private var doneButton: UIBarButtonItem {
        UIBarButtonItem(
            barButtonSystemItem: .done,
            target: view,
            action: #selector(UIView.endEditing)
        )
    }

    private var flexibleSpace: UIBarButtonItem {
        UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
    }

}
