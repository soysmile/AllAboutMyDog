//
//  ViewController.swift
//  MoreAboutYourDog
//
//  Created by George Heints on 15.01.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var test = [testing]()
    var test1 = [info]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogListOnline()
        
        self.tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func dogListOnline(){
        
        let url = "https://raw.githubusercontent.com/soysmile/AllAboutMyDog/master/MoreAboutYourDog/dogs.json"
        guard let urlPath = URL(string: url) else {return}
        URLSession.shared.dataTask(with: urlPath) { (data, response, error) in
            guard let data = data else{return}
            do{
                let courses = try JSONDecoder().decode(info.self, from: data)
                self.test = courses.dogs
                print(self.test)
                print("---------")
                
            }
            catch{
                print("error")
            }
            }.resume()
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(test.count)
        return test.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dogCell") as! DogTableViewCell
        
        cell.dogLbl?.text = test[indexPath.row].name_ru?.capitalized
        cell.dogViewImage.downloadImg(from: (test[indexPath.row].imageUrl)!)
    
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.dogViewImage.layer.cornerRadius = cell.dogViewImage.frame.height / 2
        cell.backgroundColor = .clear
        cell.cellView.backgroundColor = UIColor(white: 0, alpha: 0.75)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//required App Transport Security Settings
extension UIImageView{
    func downloadImg(from url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil{
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
