//
//  ExampleVC.swift
//  RxTableView
//
//  Created by SonNV-D1 on 5/6/20.
//  Copyright © 2020 SonNV-D1. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ExampleVC: UIViewController {

    var circleView: UIView!
    var location: CGPoint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton: UIBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(action))
        self.navigationItem.rightBarButtonItem = addButton
        setup()
    }
    
    func setup() {
        // Add circle view
        circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100.0, height: 100.0)))
        circleView.layer.cornerRadius = circleView.frame.width / 2.0
        circleView.center = view.center
        circleView.backgroundColor = .green
        view.addSubview(circleView)
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(circleMoved(_:)))
        circleView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func circleMoved(_ recognizer: UIPanGestureRecognizer) {
        let location = recognizer.location(in: view)
        UIView.animate(withDuration: 0.1, animations: {
            self.circleView.center = location
        })
    }
    
    
    @objc func action(_ sender: Any) {
        let vc = LoginVC(nibName: "LoginVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: view)
            self.circleView.center = location
        }
    }
}

