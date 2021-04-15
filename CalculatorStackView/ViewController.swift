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
        label.font = .systemFont(ofSize: 75)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()

    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metric.parentStackViewSpacing
        return stackView
    }()

    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metric.buttonsStackViewSpacing
        return stackView
    }()

    private lazy var clearButton = createButton(with: "AC", titleColor: .black, backgroundColor: .lightGray)
    private lazy var plusMinusButton = createButton(with: "+/-", titleColor: .black, backgroundColor: .lightGray)
    private lazy var percentButton = createButton(with: "%", titleColor: .black, backgroundColor: .lightGray)
    private lazy var divisionButton = createButton(with: "/", titleColor: .white, backgroundColor: .systemOrange)
    private lazy var firstStackView = createHorizontalStackView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        view.addSubview(parentStackView)

        parentStackView.addArrangedSubview(resultLabel)
        parentStackView.addArrangedSubview(buttonsStackView)

        buttonsStackView.addArrangedSubview(firstStackView)

        firstStackView.addArrangedSubview(clearButton)
        firstStackView.addArrangedSubview(plusMinusButton)
        firstStackView.addArrangedSubview(percentButton)
        firstStackView.addArrangedSubview(divisionButton)
    }

    private func setupLayout() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18).isActive = true
        parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true

    }

    private func setupView() {
        view.backgroundColor = .black
    }

    //MARK: - Private functions

    private func createButton(with title: String, titleColor: UIColor, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)

        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .medium)
        button.backgroundColor = backgroundColor

        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metric.buttonHeight / 2

        return button
    }

    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        return stackView
    }

}

// MARK: - Constants

extension ViewController {

    enum Metric {
        static let buttonHeight: CGFloat = 75

        static let parentStackViewSpacing: CGFloat = 30
        static let buttonsStackViewSpacing: CGFloat = 15

    }
}
