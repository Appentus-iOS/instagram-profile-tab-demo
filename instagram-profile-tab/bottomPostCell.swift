//
// Created by Appentus Technologies on 28/03/22.
// Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
// 

import UIKit

class bottomPostCell: UITableViewCell {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var indexList: [Int] = []
    
    weak var delegate: BottomPostCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initViews() {
        scrollView.delegate = self
        initScrollView()
    }
    
    func initScrollView() {
        guard let scrollStackView = self.scrollView.subviews.first(where: {$0.isKind(of: UIStackView.self)}) else { return }
        scrollStackView.subviews.enumerated().forEach { index, view in
            if let viewPost = view as? ChildView {
                viewPost.initViews(with: indexList[index])
            }
        }
    }
    
}

extension bottomPostCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentoffset = scrollView.contentOffset
        let index = Int(contentoffset.x / self.frame.width)
        print(index)
        delegate?.didChangePage(page: index)
    }
}

protocol BottomPostCellDelegate: AnyObject {
    func didChangePage(page: Int)
}
