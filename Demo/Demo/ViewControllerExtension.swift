//
//  ViewControllerExtension.swift
//  Demo
//
//  Created by Rajkumar on 19/01/23.
//

import Foundation
import UIKit

extension ViewController :UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
              return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if imageDetailArray.count > 0
        {
            return imageDetailArray.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:DetailTableViewCell = detailTblView?.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        let imageName = imageDetailArray[indexPath.row].image
        let image = UIImage(named: imageName, in: Bundle.main, compatibleWith: nil)


            cell.imgView?.image = image
        cell.imgView?.contentMode = .scaleToFill
        
        let Name = imageDetailArray[indexPath.row].name
        cell.nameLbl?.text = Name
        
        let detail = imageDetailArray[indexPath.row].detail
        cell.detailLbl?.text = detail

        return cell


    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {



    }


}
//
extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
           return 1
       }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if imageDataArray.count > 0
        {
           
            return imageDataArray.count
        }
        return 0
           
       }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = imageCollectionView?.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
           let imageName = imageDataArray[indexPath.row].image
           let image = UIImage(named: imageName, in: Bundle.main, compatibleWith: nil)


               cell.imgView?.image = image
           cell.imgView?.contentMode = .scaleToFill
           
             return cell
       }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let frameSize = collectionView.frame.size
                return CGSize(width: frameSize.width - 10, height: frameSize.height)

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0

    }
}
