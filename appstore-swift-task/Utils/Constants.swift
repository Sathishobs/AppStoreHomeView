//
//  Constants.swift
//  appstore-swift-task
//
//  Created by Mac-OBS-09 on 14/02/19.
//  Copyright © 2019 Mac-OBS-09. All rights reserved.
//

import Foundation
import UIKit

enum GlobalConstants {
    
    static let cardHighlightedFactor: CGFloat = 0.96
    static let statusBarAnimationDuration: TimeInterval = 0.4
    static let cardCornerRadius: CGFloat = 16
    static let dismissalAnimationDuration: TimeInterval = 0.6
    
    static let cardVerticalExpandingStyle: CardVerticalExpandingStyle = .fromTop
    
    
    /// Without this, there'll be weird offset (probably from scrollView) that obscures the card content view of the cardDetailView.
    static let isEnabledWeirdTopInsetsFix = true
    
    /// If true, will draw borders on animating views.
    static let isEnabledDebugAnimatingViews = false
    
    /// If true, this will add a 'reverse' additional top safe area insets to make the final top safe area insets zero.
    static let isEnabledTopSafeAreaInsetsFixOnCardDetailVC = false
    
    /// If true, will always allow user to scroll while it's animated.
    static let isEnabledAllowsUserInteractionWhileHighlightingCard = true
    
    static let isEnabledDebugShowTimeTouch = true
}

extension GlobalConstants {
    enum CardVerticalExpandingStyle {
        /// Expanding card pinning at the top of animatingContainerView
        case fromTop
        
        /// Expanding card pinning at the center of animatingContainerView
        case fromCenter
    }
}

/** These are constants contents to show in home page card list view.
    this shall be revoked once done programming to rendered date thru endpoints" **/

struct CardViewConstants {
    
    static let game_of_day_primary = "GAME OF THE DAY"
    static let game_of_day_secondary = "Minecraft makes a splash"
    static let game_of_day_description = "The ocean is a big place. Tap to read how Minecraft's just got even bigger."
    static let game_of_day_image = "elephant.jpg"
    
    static let app_of_day_primary = "APP OF THE DAY"
    static let app_of_day_secondary = "Something we want"
    static let app_of_day_description = "They have something we want which is not something we need."
    static let app_of_day_image = "cat.jpg"
    
    static let letsplay_primary = "LET'S PLAY"
    static let letsplay_secondary = "Cats, cats, cats!"
    static let letsplay_description = "Play these games right meow."
    static let letsplay_church_image = "church.jpg"
    static let letsplay_dark_image = "dark-1.jpg"
    static let letsplay_lion_image = "lion.jpg"

    static let wont_believe_primary = "You won't believe this guy"
    static let wont_believe_secondary = "Something we want"
    static let wont_believe_description = "They have something we want which is not something we need."
    static let wont_believe_coffee_image = "coffee-bean.jpg"
    static let wont_believe_dark2_image = "dark-2.jpg"
    static let wont_believe_dark3_image = "dark-3.jpg"
    static let wont_believe_sitting_image = "sitting.jpg"

    static let rainbow_primary = "Rainbow Colors"
    static let rainbow_secondary = "Raining day!"
    static let rainbow_description = "Play these games right meow."
    static let rainbow_image = "rainbow.jpg"
}

struct ControllerNames {
    static let card_detail_view_controller = "CardDetailVC"
}
