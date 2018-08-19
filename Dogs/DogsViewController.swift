//
//  DogsViewController.swift
//  Dogs
//
//  Created by Bennett on 2018-08-18.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DogCell"
private var dogArray:[Dog] = []

class DogsViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        self.setupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setupData() {
        let dog1 = Dog.init(title: "Dog 1", image: "image1", url: "")
        let dog2 = Dog.init(title: "Dog 2", image: "image2", url: "")
        
        dogArray = [dog1, dog2]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dogArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DogViewCell
    
        // Configure the cell
        cell.configure(with: dogArray[indexPath.row])
    
        return cell
    }



}
