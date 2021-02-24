//
//  PhotosViewController.swift
//  PhotosApp
//
//  Created by Gabriel on 2/23/21.
//

import UIKit
import PhotosAPI

class PhotosViewController: UIViewController {

    let apiManager = APIManager()
    var photos: [Photo] = []

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
    }
    
    /**
    Fetches photos from APIManager.
    */
    
    func fetchPhotos() {
        
        self.apiManager.fetchPhotos { (result) in
            switch result {

            case .success(let photos):
                self.photos.append(contentsOf: photos)
                self.tblView.reloadData()

            case .failure(let error):
                print("The photo fetch is failure: \(error)")

            }
        }
    }
}

//MARK : Table view data sources

extension PhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as? PhotoTableViewCell else {
            return UITableViewCell()
        }
        
        let photo = self.photos[indexPath.row]
        cell.photo = photo
        return cell
    }
}
