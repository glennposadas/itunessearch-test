//
//  DataTableViewCell.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/10/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import SnapKit
import UIKit

/**
 Enum to determine the type of the current cell.
 */
enum DataCellType {
    /// The short is used for songs kind of cell, with square-ish artwork imageView.
    case short
    /// The long type is used for books and movies.
    case long
}

/**
 The protocol of `DataTableViewCell`.
 This will contian the events from the views, such as GetButton.
 */
protocol DataCellDelegate { }

/**
 The `DataTableViewCell` is merely the common cell to be used in this project.
 A collection cell was put into consideration but it would take time.
 Collection cell to group songs and other `kind`s, much like the original Itunes Store app.
 
 However though, it is being aimed that the artwork to be dynamic based on `kind`.
 */
class DataTableViewCell: BaseTableViewCell {

    // MARK: - Properties
    
    private var constraint_ArtworkHeight: Constraint?
    private var constraint_ArtworkWidth: Constraint?
    private var constraint_ButtonWidth: Constraint?
    
    private lazy var imageView_Artwork: UIImageView = {
        return UIImageView(image: UIImage(named: "ic_placeholder"))
    }()
    
    private lazy var label_Title: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        return label
    }()
    
    private lazy var label_Subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.alpha = 0.8
        return label
    }()
    
    private lazy var stackView_Labels: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.label_Title, self.label_Subtitle])
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var button_Get: GetButton = {
        return GetButton(type: .custom)
    }()
    
    private var cellType: DataCellType!
    
    // MARK: - Functions
    
    func setupCell(data: Result, type: DataCellType) {
        self.cellType = type
    }
    
    // MARK: Overrides

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubviews()
        
        self.contentView.addSubview(self.imageView_Artwork)
        self.imageView_Artwork.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8.0)
            $0.leading.equalToSuperview().inset(16.0)
            self.constraint_ArtworkWidth = $0.width.equalTo(40.0).constraint
            self.constraint_ArtworkHeight = $0.height.equalTo(40.0).constraint
        }
        
        self.contentView.addSubview(self.button_Get)
        self.button_Get.snp.makeConstraints {
            $0.height.equalTo(44.0)
            $0.trailing.equalToSuperview().inset(16.0)
            self.constraint_ButtonWidth = $0.width.equalTo(100.0).constraint
        }
        
        self.contentView.addSubview(self.stackView_Labels)
        self.stackView_Labels.snp.makeConstraint {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.imageView_Artwork.snp.trailing).offset(8.0)
            $0.trailing.equalTo(self.button_Get.snp.leading).offset(-8.0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
