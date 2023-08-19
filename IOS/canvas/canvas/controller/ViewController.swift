//
//  ViewController.swift
//  canvas
//
//  Created by 김예림 on 2023/08/17.
//

import UIKit

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    override func loadView() {
        self.view = canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.backgroundColor = .white

    }


}

