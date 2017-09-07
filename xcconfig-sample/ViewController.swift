//
//  ViewController.swift
//  xcconfig-sample
//
//  Created by Jaakko Kangasharju on 04.07.17.
//  Copyright © 2017 Futurice. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.text = Bundle.main.bundleIdentifier
        title.textAlignment = .center
        view.addSubview(title)

        title.snp.makeConstraints { make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(44)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
