//
//  BaseViewController.swift
//  DiaryFoundation
//
//  Created by Michael Kho on 2023/03/13.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController {
    var coodinator: BaseCoordinator?

    public override init(nibName nibNameOrNil: String?,
                         bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
