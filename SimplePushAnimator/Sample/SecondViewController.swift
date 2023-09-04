//
//  SecondViewController.swift
//  SimplePushAnimator
//
//  Created by Kosuke Kito on 2015/06/22.
//  Copyright (c) 2015年 Kosuke Kito. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    private var transitioner: Transitioner?
    
    class func instantiate() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Second") as! SecondViewController
        viewController.modalPresentationStyle = .fullScreen // 重要
        viewController.transitioner = Transitioner(style: .SimplePush, viewController: viewController)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SecondViewController {
    @IBAction func buttonTapped(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
