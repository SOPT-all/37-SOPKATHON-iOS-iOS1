//
//  SelectCollectionView.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 박정환 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class SelectCollectionView: UIView {

    // MARK: - Properties
    
    private var items: [String] = []
    var onSelect: ((String) -> Void)?

    // MARK: - UI Components

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    ).then {
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
        $0.allowsMultipleSelection = false
        $0.register(
            SelectCell.self,
            forCellWithReuseIdentifier: SelectCell.id
        )
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }

    convenience init(items: [String]) {
        self.init(frame: .zero)
        self.items = items
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        updateItemSize()
    }
}

// MARK: - Setup

private extension SelectCollectionView {

    func setStyle() {
        backgroundColor = .white
    }

    func setUI() {
        addSubview(collectionView)

        collectionView.clipsToBounds = false
        collectionView.layer.masksToBounds = false
    }

    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Public

extension SelectCollectionView {

    func configure(items: [String]) {
        self.items = items
        collectionView.reloadData()
    }
}

// MARK: - Layout Helpers

private extension SelectCollectionView {

    func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }

    func updateItemSize() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        let totalSpacing: CGFloat = 20 + 20 + 20
        let width = (bounds.width - totalSpacing) / 2
        layout.itemSize = CGSize(width: width, height: 32)
        layout.invalidateLayout()
    }
}

// MARK: - UICollectionViewDataSource

extension SelectCollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SelectCell.id,
            for: indexPath
        ) as! SelectCell

        let model = items[indexPath.item]
        cell.configure(text: model)

        let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
        cell.updateSelection(isSelected: isSelected)

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension SelectCollectionView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let selected = collectionView.indexPathsForSelectedItems {
            for index in selected where index != indexPath {
                collectionView.deselectItem(at: index, animated: false)
                if let cell = collectionView.cellForItem(at: index) as? SelectCell {
                    cell.updateSelection(isSelected: false)
                }
            }
        }

        if let cell = collectionView.cellForItem(at: indexPath) as? SelectCell {
            cell.updateSelection(isSelected: true)
        }

        onSelect?(items[indexPath.item])
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SelectCell {
            cell.updateSelection(isSelected: false)
        }
    }
}
