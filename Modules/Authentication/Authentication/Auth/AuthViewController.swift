//
//  AuthViewController.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import Foundation
import UIKit

public final class AuthViewController: UIViewController {

    private var viewModel: AuthViewModelProtocol

    public init(viewModel: AuthViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "AuthViewController", bundle: .AuthBundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonDidTapped(_ sender: Any) {
        viewModel.loginButtonDidTapped()
    }
}
