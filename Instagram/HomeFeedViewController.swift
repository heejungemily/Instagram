//
//  HomeFeedViewController.swift
//  Instagram
//
//  Created by Emily Heejung Son on 2/26/18.
//  Copyright © 2018 Emily Heejung Son. All rights reserved.
//

import UIKit
import Parse

class HomeFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var homeTableView: UITableView!
    
    var postArray: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    
    func queryPosts() {
        let query = Post.query()
        query?.order(byDescending: "createdAt")
        query?.includeKey("author")
        query?.limit = 20
        
        // fetch data asynchronously
        
        query?.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
            if let posts = posts as? [Post] {
                // do something with the data fetched
                self.postArray = posts
                
            } else {
                // handle error
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! Post
        //cell.
        
        return cell*/
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
