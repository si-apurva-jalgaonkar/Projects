//
//  ViewController.swift
//  Numbers
//
//  Created by Apurva Jalgaonkar on 11/10/23.
//

// ViewController.swift
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    private let viewModel = NumberViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Register the custom cell XIB
        let cellNib = UINib(nibName: "NumberTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "NumberCell")
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfNumbers()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath) as! NumberTableViewCell
        let number = viewModel.number(at: indexPath.row)
        cell.configure(with: number)
        return cell
    }
}

