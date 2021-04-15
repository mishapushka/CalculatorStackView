//
//  ViewController.swift
//  CalculatorStackView
//
//  Created by mac on 15.04.2021.
//

import UIKit

class ViewController: UIViewController {

    private lazy var resultLabel: UILabel = {
        let label = UILabel()

        label.text = "0"
        label.font = .systemFont(ofSize: 75, weight: .regular)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()
    }

    // MARK: - Settings

    private func setupHierarchy() {

    }

    private func setupLayout() {

    }

    private func setupView() {
        view.backgroundColor = .black
    }

    //MARK: - Private functions

    private func addCornerRadius(for buttons: [UIButton]) {
        buttons.forEach {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = Metric.buttonHeight / 2
        }
    }

}

// MARK: - Constants

extension ViewController {

    enum Metric {
        static let buttonHeight: CGFloat = 75
    }
}
