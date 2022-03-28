//
// Created by Appentus Technologies on 28/03/22.
// Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var profileTblView: UITableView!
    
    var currentBottomIndex: Int = 0
    var indexList: [Int] = [
    5,30, 50, 29
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: "tabsHeaderCell")?.contentView
        view?.backgroundColor = UIColor.white
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "bottomPostCell", for: indexPath) as? bottomPostCell {
            cell.indexList = self.indexList
            cell.delegate = self
            cell.initViews()
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let oddAdd = indexList[currentBottomIndex] % 2 == 0 ? 0 : 1
        let values: CGFloat = CGFloat(indexList[currentBottomIndex] / 3) + CGFloat(oddAdd)
        let estimatedSize = CGFloat(values * self.profileTblView.frame.width/3)
        if estimatedSize < self.profileTblView.frame.height - 50 {
            return (self.profileTblView.frame.height - 50)
        }
        return estimatedSize
    }
}

extension ViewController: BottomPostCellDelegate {
    func didChangePage(page: Int) {
        self.currentBottomIndex = page
        self.profileTblView.reloadData()
    }
}
