//
//  ThirdViewController.swift
//  Coordinator Deneme
//
//  Created by Erislam Nurluyol on 7.12.2023.
//

import UIKit

class ThirdViewController: UIViewController {
    
    weak var coordinator: ThirdCoordinator?
    
    
    //MARK: - Initializers & Deinitializers
    deinit { coordinator?.parentCoordinator?.childDidFinish(coordinator) }
    
    
    //MARK: - UI Elements
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "ThirdViewController"
        return label
    }()
    
    lazy var popButton: UIButton = {
        let button = UIButton(configuration: .bordered())
        button.setTitle("Back to SecondViewController", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //MARK: - Configuration Methods
    private func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
        configurePopButton()
        addTargets()
    }
    
    private func configureLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func configurePopButton() {
        view.addSubview(popButton)
        popButton.translatesAutoresizingMaskIntoConstraints = false
        popButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        popButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    
    //MARK: - Targets
    private func addTargets() {
        popButton.addTarget(self, action: #selector(popButtonTapped), for: .touchUpInside)
    }
    
    
    //MARK: - @Actions
    @objc private func popButtonTapped() { coordinator?.finish() }
    
}
