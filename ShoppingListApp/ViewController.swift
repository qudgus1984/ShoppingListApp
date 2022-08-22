//
//  ViewController.swift
//  ShoppingListApp
//
//  Created by 이병현 on 2022/08/22.
//

import UIKit
import SnapKit
import RealmSwift

class ViewController: UIViewController {
    
    let localRealm = try! Realm()
    var tasks: Results<UserShoppingList>!
    @IBOutlet weak var shoppingListTitle: UITextField!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tasks = localRealm.objects(UserShoppingList.self)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ShoppingListTableViewCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tasks = localRealm.objects(UserShoppingList.self)

    }
    
    @IBAction func plusButtonClicked(_ sender: UIButton) {
        let task = UserShoppingList(title: shoppingListTitle.text!)
        try! localRealm.write {
            localRealm.add(task)
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell") as! ShoppingListTableViewCell
        
        let row = tasks[indexPath.row]
        
        cell.shoppingLabel.text = row.title


        return cell
    }
    
    
}
