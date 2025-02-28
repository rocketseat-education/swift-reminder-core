//
//  MenuView.swift
//  ExampleCore
//
//  Created by Arthur Rios on 25/02/25.
//


import Foundation
import UIKit
import CoreFramework

class MenuView: UIView {
    var didTapOnboarding: (() -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Example Menu"
//        label.font = Typography.heading
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let onboardingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Onboarding", for: .normal)
        button.layer.cornerRadius = Metrics.medium
        button.backgroundColor = .red
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapOnboardingButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let checkbox = ToggleCheckbox()
    
    private let testCheckboxButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Test checkbox", for: .normal)
        button.layer.cornerRadius = Metrics.medium
        button.backgroundColor = .red
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapCheckboxButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(onboardingButton)
        addSubview(testCheckboxButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            onboardingButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            onboardingButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            onboardingButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            onboardingButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            onboardingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            
            testCheckboxButton.topAnchor.constraint(equalTo: onboardingButton.bottomAnchor, constant: Metrics.medium),
            testCheckboxButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            testCheckboxButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            testCheckboxButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
        ])
    }
    
    @objc
    private func didTapOnboardingButton() {
        didTapOnboarding?()
        //chamar o onboarding view
    }
    
    @objc
    private func didTapCheckboxButton() {
        let checkBoxViewController = CheckboxViewController()
        if let parentViewController = self.window?.rootViewController {
            parentViewController.present(checkBoxViewController, animated: true)
        }
    }
}
