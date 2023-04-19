//
//  AmityBoxBinding.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

#warning("FIXME: This class should be removed and all callers will be replaced with delegae or completion blocks.")
final class AmityBoxBinding<T> {
    typealias Listener = (T) -> ()
   
   // MARK: - variables for the binder
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    var listener: Listener?
    
    // MARK: - intializers for the binder
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: -  function for the binder
    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
