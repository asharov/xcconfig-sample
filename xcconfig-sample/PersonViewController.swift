//
//  PersonViewController.swift
//  xcconfig-sample
//

import UIKit
import SnapKit

class PersonViewController : UIViewController {

    private let person: Person

    init(person: Person) {
        self.person = person

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.text = person.firstName + " " + person.lastName
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)

        let companyLabel = UILabel()
        companyLabel.font = UIFont.systemFont(ofSize: 16)
        companyLabel.text = person.company
        companyLabel.textAlignment = .center
        view.addSubview(companyLabel)

        let joinDateLabel = UILabel()
        joinDateLabel.font = UIFont.systemFont(ofSize: 16)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        joinDateLabel.text = "Joined \(dateFormatter.string(from: person.joinDate))"
        joinDateLabel.textAlignment = .left
        view.addSubview(joinDateLabel)

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.trailing.equalTo(view)
        }

        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.trailing.equalTo(view)
        }

        joinDateLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view)
        }
    }
}
