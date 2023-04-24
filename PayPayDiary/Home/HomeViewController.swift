//
//  HomeViewController.swift
//  PayPayDiary
//
//  Created by Michael Kho on 2023/03/10.
//

import DiaryCoordinator
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diary"

        collectionView.register(UINib(nibName: "EntriesCell", bundle: nil), forCellWithReuseIdentifier: "EntriesCell")

        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(goToSettingsButtonTapped))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

    @objc
    private func goToSettingsButtonTapped() {
        GlobalCoordinator.shared.navigate(.settings(.setting(
            profileId: "some-profile-id")))
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EntriesCell", for: indexPath) as? EntriesCell else { return UICollectionViewCell() }
        cell.setupCell(needToHideImage: false)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            GlobalCoordinator.shared.navigate(.content(.imageContent(
                title: "abc",
                content: "abc",
                urlString: "abc")))
        } else {
            GlobalCoordinator.shared.navigate(.content(.videoContent(
                title: "def",
                content: "def",
                urlString: "def")))
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 350)
    }
}
