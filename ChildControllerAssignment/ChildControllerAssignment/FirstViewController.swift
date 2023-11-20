//
//  FirstViewController.swift
//  ChildControllerAssignment
//
//  Created by Apurva Jalgaonkar on 04/11/23.
//

import UIKit

class FirstViewController: UIViewController {

    var models = [Model]()
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        models.append(Model(imageName: "dog1"))
        models.append(Model(imageName: "dog2"))
        models.append(Model(imageName: "dog3"))
        models.append(Model(imageName: "dog4"))
        models.append(Model(imageName: "dog5"))
        models.append(Model(imageName: "dog6"))

        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
//        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionView?.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        view.addSubview(collectionView!)

//        view.backgroundColor = .blue

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
      
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }
      
        let model = models[indexPath.row]
        cell.configure(with:model)
        return cell
    }
}
    
