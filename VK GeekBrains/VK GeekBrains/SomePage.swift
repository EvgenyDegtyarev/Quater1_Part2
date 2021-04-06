//
//  SomePage.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 05.04.2021.
//

import UIKit

class SomePage: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

}
