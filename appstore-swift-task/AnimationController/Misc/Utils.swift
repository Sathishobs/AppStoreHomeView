//
//  Utils.swift
//  appstore-swift-task
//
//  Created by Mac-OBS-09 on 14/02/19.
//  Copyright © 2019 Mac-OBS-09. All rights reserved.
//

import Foundation

func getRandomImageURL() -> URL {
    let rand = Int(arc4random_uniform(1000))
    return URL(string: "https://picsum.photos/200/300?image=\(rand)")!
}
