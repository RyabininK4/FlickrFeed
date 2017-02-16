//
//  ViewController.swift
//  FlickrFeed
//
//  Created by Кирилл Рябинин on 16.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [Photo]? = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInfoPhoto()
    }

    
    func getInfoPhoto()
    {
        let urlRequest = URLRequest(url: URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response, error) in
            if error != nil
            {
                print(error)
                return
            }
            
            self.photos = [Photo]()
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let photosFromJson = json["items"] as? [[String: AnyObject]]
                {
                    for photoFromJson in photosFromJson
                    {
                        let photo = Photo()
                        if let title = photoFromJson["title"] as? String,
                            let date = photoFromJson["date_taken"] as? String,
                            let tags = photoFromJson["tags"] as? String,
                            let url =  photoFromJson["link"] as? String
                        {
                            photo.date = date
                            photo.tags = tags
                            photo.headline = title
                            photo.url = url
                        }
                        if let url = photoFromJson["media"] {
                            if let urlToImage = url["m"] as? String
                            {
                                photo.urlImage = urlToImage
                            }
                        }
                        self.photos?.append(photo)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch let error
                {
                print(error)
                }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        cell.title.text = self.photos?[indexPath.item].headline
        cell.tags.text = self.photos?[indexPath.item].tags
        cell.date.text = self.photos?[indexPath.item].date
        cell.imgView.downloadImage(from: (self.photos?[indexPath.item].urlImage)!)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos?.count ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebViewController
        
        webVC.url = self.photos?[indexPath.item].url
        self.present(webVC, animated: true, completion: nil)
    }
    
}

extension UIImageView
{
    func downloadImage(from urlToImage: String)
    {
        let urlRequest = URLRequest(url: URL(string: urlToImage)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, responce, error) in
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}

