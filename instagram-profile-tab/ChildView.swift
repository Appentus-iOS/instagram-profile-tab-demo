//
// Created by Appentus Technologies on 28/03/22.
// Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
// 

import UIKit

class ChildView: UIView {

    @IBOutlet weak var postCollectionView: UICollectionView!
  
    weak var delegate: ChildViewActions?
    var items: Int = 0
    
    func initViews(with items: Int) {
        self.items = items
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
        self.postCollectionView.reloadData()
    }
}

extension ChildView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ChildView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollView(scrollView)
    }
}

protocol ChildViewActions: AnyObject {
    func scrollView(_ sender: UIScrollView)
}
