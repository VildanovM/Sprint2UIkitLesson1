//
//  ThirdViewController.swift
//  UIKitLesson
//
//  Created by Максим Вильданов on 08.11.2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var circleGesture = GradientView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        createSwipeGesture()
        
        circleGesture = GradientView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        circleGesture.center = view.center
        circleGesture.layer.cornerRadius = 100
        circleGesture.backgroundColor = .white
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(gradientChange(sender:)))
        circleGesture.addGestureRecognizer(panGesture)
        view.addSubview(circleGesture)
    }
    
    
    func createSwipeGesture() {
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(popViewController))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func gradientChange(sender: UIPanGestureRecognizer) {
        
        let point:CGPoint = sender.translation(in: self.view)
        sender.setTranslation(CGPoint.zero, in: self.view)
        let gradientY = circleGesture.frame.origin.y + point.y
        let gradientX = circleGesture.frame.origin.x + point.x
        circleGesture.frame = CGRect(x: gradientX, y: gradientY, width: circleGesture.frame.width, height: circleGesture.frame.height)
        GradientView.animate(withDuration: 0.05, animations: { self.view.layoutIfNeeded() })
        
        let locationY = Float(sender.location(in: circleGesture).y)
        let locationX = Float(sender.location(in: circleGesture).x)
        let firstColor = UIColor(red: CGFloat(locationY/255), green: CGFloat(locationY/255), blue: CGFloat(locationY/255), alpha: 1)
        let secondColor = UIColor(red: CGFloat(locationX/255), green: CGFloat(locationX/255), blue: CGFloat(locationX/255), alpha: 1)
        circleGesture.colors = [firstColor, secondColor]
        
    }
    
    
    @objc func popViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    

}
