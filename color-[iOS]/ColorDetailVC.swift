//
//  ColorDetailVC.swift
//  color-[iOS]
//
//  Created by Praval Gautam on 25/04/23.
//

import UIKit

class ColorDetailVC: UIViewController {
    var color: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = color ?? UIColor.black
    
    }
 

}
