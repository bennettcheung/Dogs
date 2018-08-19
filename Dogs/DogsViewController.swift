//
//  DogsViewController.swift
//  Dogs
//
//  Created by Bennett on 2018-08-18.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DogCell"
private var dogArray:[Photo] = []


class DogsViewController: UICollectionViewController {

    // 1
    let defaultSession = URLSession(configuration: .default)
    // 2
    var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        self.getSearchResults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    func getSearchResults() {
        let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=8759bfb887b8e55c9a7515d8ae1fe5ca&tags=dog")
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard error == nil else {
                print("returning error")
                return
            }
            
            guard let content = data else {
                print("not returning data")
                return
            }
            
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Not containing JSON")
                return
            }
            
            if let photos = json["photos"] as? [String: Any] {
                if let photo = photos["photo"] as? [Any] {
                    for item in photo{
                        let item = item as? [String: Any]
                        
                        let title = (item!["title"] as? String)!
                        
                        let farm = (item!["farm"] as? Int)!
                        let server = (item!["server"] as? String)!
                        let id = (item!["id"] as? String)!
                        let secret = (item!["secret"] as? String)!
                        
                        let url = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
                        
                        let dog = Photo.init(title: title, id: id, url: url)
                        dogArray.append(dog)
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
        
        task.resume()
        
    }
    



}
