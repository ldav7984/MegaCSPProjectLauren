//
//  ArtCollectionViewController.swift
//  DrawingProjectLauren
//
//  Created by Davis, Lauren on 11/7/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "artidentifier"

//custom subclass of type UICollectionViewController
public class ArtCollectionViewController: UICollectionViewController
{
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0,
                                             bottom: 50.0, right: 20.0)
    private let itemsPerRowCompact : CGFloat = 4
    private let itemsPerRowNormal : CGFloat = 6
    
    private let creativeCS : [UIImage?] =
        //? only returns the UIImage if it is valid
    {
        return [
            UIImage(named: "LaurenDavisOctocat"),
            UIImage(named: "Frosch"),
            UIImage(named: "TemmieVillage"),
            UIImage(named: "Mimikyu"),
            UIImage(named: "LaurenJavaHaiku"),
            UIImage(named: "LaurenSwiftHaiku"),
            UIImage(named: "ArtAppDrawing"),
            UIImage(named: "LaurenMainframeHaiku"),
            UIImage(named: "LaurenTechnewsImageRobot")
            
        ]
    } ()
    
    private let labels : [String] =
    {
        return [
        "My Octokitty",
        "Frosch",
        "Temmie Village",
        "Mimikyu",
        "Java Haiku",
        "Swift Haiku",
        "App Drawing",
        "Mainframe Haiku",
        "Technews Article Meme"
        ]
    } ()

    //MARK: - Lifecycle
    
    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation / Layout

    public override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }

    public override func collectionView(_ collectionView: UICollectionView,
                                        numberOfItemsInSection section: Int) -> Int
    {
        return creativeCS.count
    }
    
    //MARK: UICollectionViewDataSource
    
    public override func collectionView(_ collectionView: UICollectionView,
                                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {       //dequeue means  to remove from the front of the list
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                for: indexPath) as! ArtCell
                                //! force unwraps from one kind to another (force unwraps the reusableCell as an ArtCell custom class)
    
        artCell.backgroundColor = .purple
        artCell.artImage.image = creativeCS [indexPath.row]
        //.row is like .get on Java arraylist
        artCell.artLabel.text = labels[indexPath.row]
        //assigns the correct text to the label underneath each image
    
        return artCell
    }

    // MARK: UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let paddingSpace = sectionInsets.left * (itemsPerRowCompact + 1)
        let availableWidth = view.frame.width - paddingSpace
        //calculates how much space is available for the width of the frame
        let widthPerItem = availableWidth / itemsPerRowCompact
        //designates width each item can be to fit properly
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    } //Adjusts the size of the pictures based on how much room is available.
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let imageView = UIImageView(image: creativeCS[indexPath.row])
        imageView.frame = self.view.frame
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        
        self.view.addSubview(imageView)
    }
    
    //use to go back from full mode
    @objc
    private func dismissFullscreenImage(_ sender: UITapGestureRecognizer)
    {
        sender.view?.removeFromSuperview()
    }
    
    
    
    
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    
    public func collectionView(_ collectionView: UICollectionView,
                              layout collectionViewLayout: UICollectionViewLayout,
                              minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool
     {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
     {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool
     {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool
     {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?)
     {
    
    }
    */

}
