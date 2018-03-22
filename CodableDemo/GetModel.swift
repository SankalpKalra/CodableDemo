//
//  GetModel.swift
//  CodableDemo
//
//  Created by Appinventiv on 21/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

struct GetModel:Decodable{
    //var args:String
    var headers: Headers
    var origin: String
    var url: String
}

struct Headers:Decodable{
var Accept: String
var Connection: String
var Host: String
//var User_Agent: String
}
