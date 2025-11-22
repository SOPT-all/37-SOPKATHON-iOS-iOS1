//
//  SelectCollectionView.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 박정환 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class SelectCollectionView: UIViewController, UICollectionViewDelegate {

    private var items: [String]

    init(items: [String]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.items = []
        super.init(coder: coder)
    }

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 10

        let totalSpacing: CGFloat = 20 + 20 + 20
        let width = (view.bounds.width - totalSpacing) / 2
        layout.itemSize = CGSize(width: width, height: 28)

        $0.collectionViewLayout = layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }

    private func setStyle() {
        view.backgroundColor = .white
    }

    private func setUI() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = false
        collectionView.register(SelectCell.self,
                                forCellWithReuseIdentifier: SelectCell.id)
    }

    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension SelectCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SelectCell.id, for: indexPath
        ) as! SelectCell

        cell.configure(text: items[indexPath.row])
        let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
        cell.updateSelection(isSelected: isSelected)
        return cell
    }
}

extension SelectCollectionView {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let selectedIndexPaths = collectionView.indexPathsForSelectedItems {
            for selected in selectedIndexPaths where selected != indexPath {
                collectionView.deselectItem(at: selected, animated: false)
                if let previousCell = collectionView.cellForItem(at: selected) as? SelectCell {
                    previousCell.updateSelection(isSelected: false)
                }
            }
        }

        if let cell = collectionView.cellForItem(at: indexPath) as? SelectCell {
            cell.updateSelection(isSelected: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SelectCell {
            cell.updateSelection(isSelected: false)
        }
    }
}
