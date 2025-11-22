//
//  WriteReviewViewController.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//


import UIKit

import SnapKit
import Then

final class WriteReviewViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private let writeReviewView = WriteReviewView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Custom Methods
    
    override func setUI() {
        view.addSubview(writeReviewView)
    }
    
    override func setLayout() {
        writeReviewView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
