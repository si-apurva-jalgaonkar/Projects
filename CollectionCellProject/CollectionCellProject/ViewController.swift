//
//  ViewController.swift
//  CollectionCellProject
//
//  Created by Apurva Jalgaonkar on 02/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    var models = [DogImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Fetch data from the Dog CEO's Dog API
        fetchDataFromAPI()

        // Register the custom table view cell
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.dataSource = self
        table.delegate = self
    }

    func fetchDataFromAPI() {
        let apiUrlString = "https://dog.ceo/api/breeds/image/random/10" // Fetch 10 random dog images

        if let apiUrl = URL(string: apiUrlString) {
            let task = URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
                if let data = data {
                    do {
                        if let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let status = jsonData["status"] as? String,
                           status == "success",
                           let dogImages = jsonData["message"] as? [String] {
                            for imageUrl in dogImages {
                                let dogImage = DogImage(localized_name: "Dog", img: imageUrl)
                                self.models.append(dogImage)
                            }
                            
                            DispatchQueue.main.async {
                                self.table.reloadData()
                            }
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }
            task.resume()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}
