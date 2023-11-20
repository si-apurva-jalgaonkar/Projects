//
//  ViewController.swift
//  CollectionCellProject
//
//  Created by Apurva Jalgaonkar on 02/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var table: UITableView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(Model(text: "First", imageName: "dog1"))
        models.append(Model(text: "Second", imageName: "dog2"))
        models.append(Model(text: "Third", imageName: "dog3"))
        models.append(Model(text: "Fourth", imageName: "dog4"))
        models.append(Model(text: "Fifth", imageName: "dog5"))
        models.append(Model(text: "Sixth", imageName: "dog6"))


        models.append(Model(text: "First", imageName: "dog1"))
        models.append(Model(text: "Second", imageName: "dog2"))
        models.append(Model(text: "Third", imageName: "dog3"))
        models.append(Model(text: "Fourth", imageName: "dog4"))
        models.append(Model(text: "Fifth", imageName: "dog5"))
        models.append(Model(text: "Sixth", imageName: "dog6"))
        
        
        models.append(Model(text: "First", imageName: "dog1"))
        models.append(Model(text: "Second", imageName: "dog2"))
        models.append(Model(text: "Third", imageName: "dog3"))
        models.append(Model(text: "Fourth", imageName: "dog4"))
        models.append(Model(text: "Fifth", imageName: "dog5"))
        models.append(Model(text: "Sixth", imageName: "dog6"))
        
        table.register(CollectionTableViewCell.nib() , forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.dataSource = self
        table.delegate = self
        
    }

    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

