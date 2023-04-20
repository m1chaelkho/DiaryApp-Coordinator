//
//  OTPViewController.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import UIKit

class OTPViewController: UIViewController {

    private var viewModel: OTPViewModelProtocol

    public init(viewModel: OTPViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "OTPViewController", bundle: .AuthBundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToSettingsButtonTapped(_ sender: Any) {
        viewModel.goToSettingsButtonDidTapped()
    }

    @IBAction func confirmButtonDidTapped(_ sender: Any) {
        viewModel.confirmButtonDidTapped()
    }

    @IBAction func cancelButtonDidTapped(_ sender: Any) {
        viewModel.cancelButtonDidTapped()
    }
}
