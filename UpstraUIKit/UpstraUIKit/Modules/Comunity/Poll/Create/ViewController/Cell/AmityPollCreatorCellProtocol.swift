//
//  AmityPollCreatorCellProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

protocol AmityPollCreatorCellProtocolDelegate: AnyObject {
    func didPerformAction(_ cell: AmityPollCreatorCellProtocol, action: AmityPollCreatorCellAction)
    func textView(_ textView: AmityTextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
}

protocol AmityPollCreatorCellProtocol {
    var delegate: AmityPollCreatorCellProtocolDelegate? { get set }
    
    /// FIXME:
    /// Don't store indexpath inside cell. We can get indexPath for cell using tableview.indexPath(for: ) method.
    var indexPath: IndexPath? { get set }
}

enum AmityPollCreatorCellAction {
    case textViewDidChange(textView: AmityTextView)
    case textViewDidChangeSelection(textView: AmityTextView)
    case multipleSelectionChange(isMultiple: Bool)
    case selectSchedule
    case addAnswerOption
    case updateAnswerOption(text: String?)
    case deleteAnswerOption
}

enum AmityPollCreatorConstant {
    static let questionMax = 500
    static let answerMax = 200
    static let optionMax = 10
}
