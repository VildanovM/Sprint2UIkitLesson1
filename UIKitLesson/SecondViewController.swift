//
//  SecondViewController.swift
//  UIKitLesson
//
//  Created by Kaplan Deniz on 11/10/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var delegate: Coordinator?

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Второй Controller"
		view.backgroundColor = .white
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.setTitle("Go to third", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.center = view.center
        button.addTarget(self, action: #selector(goToThirdVC), for: .touchUpInside)
        view.addSubview(button)
        
	}
    
    @objc func goToThirdVC() {
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .fullScreen
        present(thirdVC, animated: true)
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: animated)
	}
}
