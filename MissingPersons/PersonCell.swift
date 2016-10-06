//
//  PersonCell.swift
//  MissingPersons
//
//  Created by Mark Price on 4/2/16.
//  Copyright © 2016 Devslopes. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    var person: Person!
    
    func configureCell(_ person: Person) {
        self.person = person
        if let url = URL(string: "\(baseURL)\(person.personImageUrl!)") {
            downloadImage(url)
        }
    }
    
    func downloadImage(_ url: URL) {
        getDataFromUrl(url) { (data, response, error) in
            DispatchQueue.main.async { () -> Void in
                guard let data = data , error == nil else { return }
                self.personImage.image = UIImage(data: data)
                self.person.personImage = self.personImage.image
            }
        }
    }
    
    func getDataFromUrl(_ url: URL, completion: @escaping ((_ data: Data?, _ response: URLResponse?, _ error: NSError?) -> Void)) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            completion(data, response, error)
        }) .resume()
    }
    
    func setSelected() {
        
        personImage.layer.borderWidth = 2.0
        personImage.layer.borderColor = UIColor.yellow.cgColor
        
        self.person.downloadFaceId()
    }
    
}
