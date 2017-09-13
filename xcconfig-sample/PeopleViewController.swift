//
//  PeopleViewController.swift
//  xcconfig-sample
//
//  Created by Jaakko Kangasharju on 04.07.17.
//  Copyright © 2017 Futurice. All rights reserved.
//

import UIKit
import SnapKit

class PeopleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var people: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "People"

        view.backgroundColor = UIColor.white

        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.text = Bundle.main.bundleIdentifier
        title.textAlignment = .center
        view.addSubview(title)

        let peopleView = UITableView()
        peopleView.dataSource = self
        peopleView.delegate = self
        peopleView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(peopleView)

        title.snp.makeConstraints { make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(44)
        }

        peopleView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(bottomLayoutGuide.snp.top)
        }

        if let backendBaseUrl = Bundle.main.fut_url(forInfoDictionaryKey: "Backend base URL"),
            let usersUrl = URL(string: backendBaseUrl + "/users") {
            (URLSession.shared.dataTask(with: usersUrl) { (data, response, error) in
                if let data = data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()),
                    let users = json as? Array<Dictionary<String, Any>> {
                    self.people = users.map { Person(json: $0) }
                    DispatchQueue.main.async {
                        peopleView.reloadData()
                    }
                }
            }).resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = person.firstName + " " + person.lastName
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people[indexPath.row]
        let viewController = PersonViewController(person: person)
        self.navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
