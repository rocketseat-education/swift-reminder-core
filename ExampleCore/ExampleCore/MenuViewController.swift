//
//  ViewController.swift
//  ExampleCore
//
//  Created by Arthur Rios on 25/02/25.
//

import UIKit
//import CoreFramework

class MenuViewController: UIViewController {
    private let contentView = MenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    private func setupActions() {
        contentView.didTapOnboarding = { [weak self] in
            self?.showOnboarding()
        }
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func showOnboarding() {
        let onboardingView = OnboardingView()
        let steps = [
            (UIImage(named: "onboarding1"), "Bem vindo ao Onboarding do Reminder"),
            (UIImage(named: "image2"), "Para cadastrar seus remédios é super simples"),
            (UIImage(named: "image3"), "Selecione o horário da primeira dose e as subsequentes"),
            (UIImage(named: "image4"), "Iremos te lembrar de tomar no horário correto"),
        ]
        onboardingView.presentOnboarding(on: view, with: steps)
    }
}
