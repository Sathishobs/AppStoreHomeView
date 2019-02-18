//
//  ViewController.swift
//  appstore-swift-task
//
//  Created by Mac-OBS-09 on 14/02/19.
//  Copyright © 2019 Mac-OBS-09. All rights reserved.
//

import UIKit

class AppStoreHomeVC: StatusBarAnimatableViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var transition: CardTransition?
    
    // Data model for card's - This shall be changed as a Model class with an alomofire mapping to auto parse the content.
    private lazy var cardModels: [CardContentViewModel] = [
        CardContentViewModel(primary: CardViewConstants.game_of_day_primary,
                             secondary: CardViewConstants.game_of_day_secondary,
                             description: CardViewConstants.game_of_day_description,
                             image: UIImage(named: CardViewConstants.game_of_day_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor))),
        
        CardContentViewModel(primary: CardViewConstants.app_of_day_primary,
                             secondary: CardViewConstants.rainbow_secondary,
                             description: CardViewConstants.app_of_day_description,
                             image: UIImage.init(named: CardViewConstants.app_of_day_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor))),
        
        CardContentViewModel(primary: CardViewConstants.letsplay_primary,
                             secondary: CardViewConstants.letsplay_secondary,
                             description: CardViewConstants.letsplay_description,
                             image: UIImage.init(named: CardViewConstants.letsplay_church_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor))),
        
        CardContentViewModel(primary: CardViewConstants.wont_believe_primary,
                             secondary: CardViewConstants.wont_believe_secondary,
                             description: CardViewConstants.wont_believe_description,
                             image: UIImage.init(named: CardViewConstants.wont_believe_coffee_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor))),
        
        CardContentViewModel(primary: CardViewConstants.letsplay_primary,
                             secondary: CardViewConstants.letsplay_secondary,
                             description: CardViewConstants.letsplay_description,
                             image: UIImage.init(named: CardViewConstants.letsplay_dark_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor))),
        
        CardContentViewModel(primary: CardViewConstants.wont_believe_primary,
                             secondary: CardViewConstants.wont_believe_secondary,
                             description: CardViewConstants.wont_believe_description,
                             image: UIImage.init(named: CardViewConstants.wont_believe_dark2_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor))),
        
        CardContentViewModel(primary: CardViewConstants.letsplay_primary,
                             secondary: CardViewConstants.letsplay_secondary,
                             description: CardViewConstants.letsplay_description,
                             image: UIImage.init(named: CardViewConstants.letsplay_lion_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor))),
        
        CardContentViewModel(primary: CardViewConstants.wont_believe_primary,
                             secondary: CardViewConstants.wont_believe_secondary,
                             description: CardViewConstants.wont_believe_description,
                             image: UIImage.init(named: CardViewConstants.wont_believe_dark3_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor))),
        
        CardContentViewModel(primary: CardViewConstants.rainbow_primary,
                             secondary: CardViewConstants.rainbow_secondary,
                             description: CardViewConstants.rainbow_description,
                             image: UIImage.init(named: CardViewConstants.rainbow_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor))),
        
        CardContentViewModel(primary: CardViewConstants.wont_believe_primary,
                             secondary: CardViewConstants.wont_believe_secondary,
                             description: CardViewConstants.wont_believe_description,
                             image: UIImage.init(named: CardViewConstants.wont_believe_sitting_image)!.resize(toWidth: UIScreen.main.bounds.size.width * (1/GlobalConstants.cardHighlightedFactor)))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make it responds to highlight state faster
        collectionView.delaysContentTouches = false
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 20
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = .init(top: 20, left: 0, bottom: 64, right: 0)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clipsToBounds = false
        collectionView.register(UINib(nibName: "\(CardCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "card")
    }
    
    override var statusBarAnimatableConfig: StatusBarAnimatableConfig {
        return StatusBarAnimatableConfig(prefersHidden: false,
                                         animation: .slide)
    }
}

//MARK: UICollectionViewDataSource
extension AppStoreHomeVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath)
    }
    
}

//MARK: UICollectionViewDelegateFlowLayout
extension AppStoreHomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! CardCollectionViewCell
        cell.cardContentView?.viewModel = cardModels[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cardHorizontalOffset: CGFloat = 20
        let cardHeightByWidthRatio: CGFloat = 1.2
        let width = collectionView.bounds.size.width - 2 * cardHorizontalOffset
        let height: CGFloat = width * cardHeightByWidthRatio
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get tapped cell location
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        // Freeze highlighted state (or else it will bounce back)
        cell.freezeAnimations()
        
        // Get current frame on screen
        let currentCellFrame = cell.layer.presentation()!.frame
        
        // Convert current frame to screen's coordinates
        let cardPresentationFrameOnScreen = cell.superview!.convert(currentCellFrame, to: nil)
        
        // Get card frame without transform in screen's coordinates  (for the dismissing back later to original location)
        let cardFrameWithoutTransform = { () -> CGRect in
            let center = cell.center
            let size = cell.bounds.size
            let r = CGRect(
                x: center.x - size.width / 2,
                y: center.y - size.height / 2,
                width: size.width,
                height: size.height
            )
            return cell.superview!.convert(r, to: nil)
        }()
        
        let cardModel = cardModels[indexPath.row]
        
        // Set up card detail view controller
        let vc = storyboard!.instantiateViewController(withIdentifier: ControllerNames.card_detail_view_controller ) as! CardDetailVC
        vc.cardViewModel = cardModel.highlightedImage()
        vc.unhighlightedCardViewModel = cardModel // Keep the original one to restore when dismiss
        let params = CardTransition.Params(fromCardFrame: cardPresentationFrameOnScreen,
                                           fromCardFrameWithoutTransform: cardFrameWithoutTransform,
                                           fromCell: cell)
        transition = CardTransition(params: params)
        vc.transitioningDelegate = transition
        
        // If `modalPresentationStyle` is not `.fullScreen`, this should be set to true to make status bar depends on presented vc.
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.modalPresentationStyle = .custom
        
        present(vc, animated: true, completion: { [unowned cell] in
            // Unfreeze
            cell.unfreezeAnimations()
        })
    }
}
