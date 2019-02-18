//
//  CardContentViewModel.swift
//  appstore-swift-task
//
//  Created by Mac-OBS-09 on 14/02/19.
//  Copyright © 2019 Mac-OBS-09. All rights reserved.
//

import UIKit

struct CardContentViewModel {
    let primary: String
    let secondary: String
    let description: String
    let image: UIImage

    func highlightedImage() -> CardContentViewModel {
        let scaledImage = image.resize(toWidth: image.size.width * GlobalConstants.cardHighlightedFactor)
        return CardContentViewModel(primary: primary,
                                    secondary: secondary,
                                    description: description,
                                    image: scaledImage)
    }
}
