//
//  ViewController.swift
//  Demo
//
//  Created by Rajkumar on 19/01/23.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var detailTblView:UITableView?
    @IBOutlet var imageCollectionView:UICollectionView?
    
    var imageDataArray = [ImageDatum]()
    var imageDetailArray = [ImageDetail]()
    var searchArray = [ImageDetail]()

    @IBOutlet var pageControl: UIPageControl?
    @IBOutlet weak var searchBar: UISearchBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       

      
        imageCollectionView?.isScrollEnabled = true
        imageCollectionView?.isPagingEnabled = true
        searchBar.delegate = self

        // Do any additional setup after loading the view.
        let a = loadJson(fileName: "data")
        if let data = a
        {
            imageDataArray.append(contentsOf: data.imageData)
            let count = imageDataArray.count

            pageControl?.numberOfPages = count

                //Set the delegate
            print(imageDataArray)
            self.imageCollectionView?.reloadData()
            let imageDetailArray1 = imageDataArray[0].imageDetail
            imageDetailArray.removeAll()
            searchArray.removeAll()
            searchArray.append(contentsOf: imageDetailArray1)
            imageDetailArray.append(contentsOf: searchArray)
            self.detailTblView?.reloadData()
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
        let row = pageControl?.currentPage ?? 0
         let imageDetailArray1 = imageDataArray[row].imageDetail
        if scrollView == imageCollectionView
        {
            searchArray.removeAll()
            imageDetailArray.removeAll()
            searchArray.append(contentsOf: imageDetailArray1)

            imageDetailArray.append(contentsOf: searchArray)
            self.detailTblView?.reloadData()
        }
      
    }
}

extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        imageDetailArray = searchText.isEmpty ? searchArray : searchArray.filter({username -> Bool in
               // If dataItem matches the searchText, return true to include it
            let text = username.name
            return text.range(of: searchText, options: .caseInsensitive) != nil
           })

        self.detailTblView?.reloadData()
      
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
            searchBar.text = ""
            searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
}
