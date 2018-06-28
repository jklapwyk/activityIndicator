//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Jamie Klapwyk on 2018-06-27.
//  Copyright © 2018 Jklapwyk. All rights reserved.
//

import UIKit
import AlamofireImage

class TableViewController: UITableViewController {
    
    var cells:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...100 {
            cells.append("https://upload.wikimedia.org/wikipedia/commons/4/4f/At_the_beach_-_Boomer_Depp.jpg")
            cells.append("https://upload.wikimedia.org/wikipedia/commons/c/c8/Early_morning_training_in_Tauranga.jpg")
            cells.append("https://upload.wikimedia.org/wikipedia/commons/8/80/M%C3%BCnchen%2C_Gedenktafel_an_Dominik_Brunner%2C_1.jpeg")
            cells.append("https://upload.wikimedia.org/wikipedia/commons/e/e5/Another_angle%2C_Lisbon%2C_Portugal_%28Sharon_Hahn_Darlin%29.jpg")
            cells.append("https://upload.wikimedia.org/wikipedia/commons/a/a7/10_January_%2884796578%29.jpg")
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.populateCell(imageUrl: URL(string:cells[indexPath.row])!)
        return cell
    }

}

class TableViewCell: UITableViewCell {
    @IBOutlet var imageThumbnailView:UIImageView!
    
    override func prepareForReuse() {
        imageThumbnailView.af_cancelImageRequest()
        imageThumbnailView.image = nil
    }
    
    func populateCell( imageUrl:URL ){
        imageThumbnailView.af_imageDownloader = SessionManager.shared.getImageDownloader()
        imageThumbnailView.af_setImage(withURL: imageUrl)
    }
}

class SessionManager {
    static let shared:SessionManager = SessionManager()
    var imageDownloader:ImageDownloader?
    func getImageDownloader() -> ImageDownloader {
        if imageDownloader == nil {
            //Remove Cache for activity indicator demonstration purposes
            let imageCache = AutoPurgingImageCache(
                memoryCapacity: 0,
                preferredMemoryUsageAfterPurge: 0
            )
            imageDownloader = ImageDownloader(
                configuration: ImageDownloader.defaultURLSessionConfiguration(),
                downloadPrioritization: .lifo,
                maximumActiveDownloads: 1,
                imageCache: imageCache
            )
        }
        return imageDownloader!
    }
}
