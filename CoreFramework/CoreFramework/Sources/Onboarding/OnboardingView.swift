//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by Arthur Rios on 25/02/25.
//

import Foundation
import UIKit

public class OnboardingView: UIView {
    private var steps: [String] = []
    private var currentStep = 0
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
