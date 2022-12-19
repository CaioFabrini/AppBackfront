//
//  NftImageCell.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 08/12/22.
//

import UIKit
import AlamofireImage

protocol NftImageCellProtocol: AnyObject {
    func actionClosedButton()
    func actionMagnifyingGlassButton()
}

class NftImageCell: UITableViewCell {
    
    static let identifier: String = "NftImageCell"
    
    private weak var delegate: NftImageCellProtocol?
    
    func delegate(delegate: NftImageCellProtocol){
        self.delegate = delegate
    }
    
    lazy var screen: NftImageCellScreen = {
        let view = NftImageCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.screen.delegate(delegate: self)
        self.contentView.addSubview(screen)
        self.configContrainsts()
    }
    
    public func setupCell(data: String) {
        guard let url = URL(string: data) else { return }
        self.screen.nftImageView.af.setImage(withURL: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContrainsts(){
        NSLayoutConstraint.activate([
            
            screen.topAnchor.constraint(equalTo: self.topAnchor),
            screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
}
extension NftImageCell: NftImageCellScreenProtocol {
    func tappedClosed() {
        delegate?.actionClosedButton()
    }
    
    func actionMagnifyingGlassButton() {
        delegate?.actionMagnifyingGlassButton()
    }
}
