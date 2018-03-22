//
//  ViewController.swift
//  CodableDemo
//
//  Created by Appinventiv on 21/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendGetBtnTapped(_ sender: UIButton) {
        
        guard let url = URL(string: "https://httpbin.org/get") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, _, _) in
            guard let data=data else { return }
            do{
                let json = try JSONDecoder().decode(GetModel.self, from: data)
                print(json.headers.Host)
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
            }catch{}
        }
        task.resume()
    }
    
    @IBAction func sendPostBtnTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //        let postDictionary = ["userUd":"55",
        //                              "id":"125",
        //                              "title":"hey THERE",
        //                              "body":"What are you doing this weekend"
        //                            ]
        let newPost = Model(userId: 1, id: 234, title: "ENCODABLE", body: "WHST")
        do{
            let jsonBody = try JSONEncoder().encode(newPost)
             print(jsonBody)
            // let jsonBody = try JSONSerialization.data(withJSONObject: postDictionary, options: [])
            request.httpBody = jsonBody
        }catch{}
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, _, _) in
            guard let data=data else { return }
            print(data)
            do{
//                let json = try JSONDecoder().decode(Model.self, from: data)
//                print(json)
                                let json = try JSONSerialization.jsonObject(with: data, options: [])
                                print(json)
                //print(json.headers.Host)
            }catch{}
        }
        task.resume()
    }
}

