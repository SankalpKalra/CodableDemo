//
//  Model.swift
//  CodableDemo
//
//  Created by Appinventiv on 21/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

struct Model:Encodable,Decodable{
    var userId:Int
    var id:Int
    var title:String
    var body:String
    
    
//    var headers:Headers
    
}
//struct Headers:Decodable{
//    //var AcceptEncoding:String
//    var Host : String
//}

