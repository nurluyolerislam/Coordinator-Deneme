//
//  SecondViewController.swift
//  Coordinator Deneme
//
//  Created by Erislam Nurluyol on 7.12.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var coordinator: SecondCoordinator?
    
    
    //MARK: - Initializers & Deinitializers
    deinit { coordinator?.parentCoordinator?.childDidFinish(coordinator) }
    
    
    //MARK: - UI Elements
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "SecondViewController"
        return label
    }()
    
    lazy var pushThirdButton: UIButton = {
        let button = UIButton(configuration: .bordered())
        button.setTitle("Go to ThirdViewController", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    lazy var popButton: UIButton = {
        let button = UIButton(configuration: .bordered())
        button.setTitle("Back to FirstViewController", for: .normal)
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
        configurePushThirdButton()
        configurePopButton()
        addTargets()
    }
    
    private func configureLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func configurePushThirdButton() {
        view.addSubview(pushThirdButton)
        pushThirdButton.translatesAutoresizingMaskIntoConstraints = false
        pushThirdButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        pushThirdButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    private func configurePopButton() {
        view.addSubview(popButton)
        popButton.translatesAutoresizingMaskIntoConstraints = false
        popButton.topAnchor.constraint(equalTo: pushThirdButton.bottomAnchor, constant: 10).isActive = true
        popButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    
    //MARK: - Targets
    private func addTargets() {
        pushThirdButton.addTarget(self, action: #selector(pushThirdButtonTapped), for: .touchUpInside)
        popButton.addTarget(self, action: #selector(popButtonTapped), for: .touchUpInside)
    }
    
    
    //MARK: - @Actions
    @objc private func pushThirdButtonTapped() {
        coordinator?.pushThird()
    }
    
    @objc private func popButtonTapped() { coordinator?.finish() }
    
}
