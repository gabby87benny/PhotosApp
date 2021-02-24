//
//  PhotoTableViewCell.swift
//  PhotosApp
//
//  Created by Gabriel on 2/23/21.
//

import UIKit
import PhotosAPI

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var lblPhotoName: UILabel!
    
    var photo: Photo? {
        didSet {
            if let photo = photo {
                if let url = URL(string: photo.thumbnailUrl) {
                    do {
                        let data =  try Data(contentsOf: url)
                        let img = UIImage(data: data)
                        thumbNail.image = img
                        lblPhotoName.text = photo.title
                    } catch  {
                        print("some error")
                    }
                }
            }
        }
    }

}
