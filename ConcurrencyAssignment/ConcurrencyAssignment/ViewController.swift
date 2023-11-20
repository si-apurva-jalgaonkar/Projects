//
//  ViewController.swift
//  ConcurrencyAssignment
//
//  Created by Apurva Jalgaonkar on 09/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataArray: [ApiData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        fetchingData()
        fetchingData2()
        fetchingData3()
        fetchingData4()
    }


    
    //API1 using gcd
    func fetchingData() {
        
        let apiUrl = URL(string: "https://demo.sportz.io/nzin01312019187360.json")!
        
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    if let error = error {
                        print("Error")
                    }
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(ApiData.self, from: data)
                    self.dataArray.append(decodedData)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error \(error.localizedDescription)")
                }
            }.resume()
        }
        
    }
    
    //API2 using gcd
    func fetchingData2() {
        
        let apiUrl2 = URL(string: "https://demo.sportz.io/sapk01222019186652.json")!
        
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: apiUrl2) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    if let error = error {
                        print("Error")
                    }
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(ApiData.self, from: data)
                    self.dataArray.append(decodedData)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error \(error.localizedDescription)")
                }
            }.resume()
        }
    }
    
    
    //API1 using oq
    func fetchingData3() {
        
        let operationQueue = OperationQueue()
        
        let operation = BlockOperation {
          let apiUrl3 = URL(string: "https://demo.sportz.io/nzin01312019187360.json")!
          URLSession.shared.dataTask(with: apiUrl3) { (data, response, error) in
              
            guard let data = data, error == nil else {
              if let error = error {
                print("Error: \(error.localizedDescription)")
              }
              return
            }
            do {
              let decodedData = try JSONDecoder().decode(ApiData.self, from: data)
              self.dataArray.append(decodedData)
                
              OperationQueue.main.addOperation {
                self.tableView.reloadData()
              }
            } catch {
              print("Error: \(error.localizedDescription)")
            }
          }.resume()
        }
        operationQueue.addOperation(operation)
      }

    
    //API2 using oq
    func fetchingData4() {
        
        let operationQueue = OperationQueue()
        
        let operation = BlockOperation {
          let apiUrl4 = URL(string: "https://demo.sportz.io/sapk01222019186652.json")!
          URLSession.shared.dataTask(with: apiUrl4) { (data, response, error) in
              
            guard let data = data, error == nil else {
              if let error = error {
                print("Error: \(error.localizedDescription)")
              }
              return
            }
            do {
              let decodedData = try JSONDecoder().decode(ApiData.self, from: data)
              self.dataArray.append(decodedData)
              OperationQueue.main.addOperation {
                self.tableView.reloadData()
              }
            } catch {
              print("Error: \(error.localizedDescription)")
            }
          }.resume()
        }
        operationQueue.addOperation(operation)
      }




    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let dataItem = dataArray[indexPath.row]
        
        cell.weather.text = "Weather: \(dataItem.matchdetail.weather)"
        cell.status.text = "Status: \(dataItem.matchdetail.series.status)"
        cell.league.text = "League: \(dataItem.matchdetail.match.league)"
        cell.result.text = "Result: \(dataItem.matchdetail.result)"
        cell.player_match.text = "Player Match: \(dataItem.matchdetail.playerMatch)"
        
        return cell
    }
    
    
}
    


