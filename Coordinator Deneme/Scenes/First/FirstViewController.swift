//
//  FirstViewController.swift
//  Coordinator Deneme
//
//  Created by Erislam Nurluyol on 7.12.2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    weak var coordinator: FirstCoordinator?
    
    
    //MARK: - Initializers & Deinitializers
    deinit { coordinator?.parentCoordinator?.childDidFinish(coordinator) }
    
    
    //MARK: - UI Elements
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "FirstViewController"
        return label
    }()
    
    lazy var pushSecondButton: UIButton = {
        let button = UIButton(configuration: .bordered())
        button.setTitle("Go SecondViewController", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addTargets()
    }
    
    
    //MARK: - Configuration Methods
    private func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
        configurePushSecondButton()
    }
    
    private func configureLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func configurePushSecondButton() {
        view.addSubview(pushSecondButton)
        pushSecondButton.translatesAutoresizingMaskIntoConstraints = false
        pushSecondButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        pushSecondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    //MARK: - Targets
    private func addTargets() {
        pushSecondButton.addTarget(self, action: #selector(pushSecondButtonTapped), for: .touchUpInside)
    }
    
    
    //MARK: - @Actions
    @objc private func pushSecondButtonTapped() { coordinator?.pushSecond() }
    
}

