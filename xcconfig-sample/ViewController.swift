//
//  ViewController.swift
//  xcconfig-sample
//
//  Created by Jaakko Kangasharju on 04.07.17.
//  Copyright © 2017 Futurice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.text = Bundle.main.bundleIdentifier
        title.sizeToFit()
        view.addSubview(title)
        title.center = view.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
