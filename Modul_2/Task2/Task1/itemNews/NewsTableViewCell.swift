//
//  NewsTableViewCell.swift
//  Task1
//
//  Created by Pavel Khlebnikov on 12.07.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var news : MyNews? {
        didSet {
            //newsImageAuthor.image = news?.image
            textNewsLabel.text = news?.textNews
            likesLabel.text = "❤︎ \(news?.likes?.countLikes ?? 0)"
            authorLabel.text = news?.typeNews
            repostLabel.text = "☞ 228"
            commentLabel.text = "✉︎ 11"
            numberOfViewstLabel.text = "❂ 5"
        }
    }
    
    private let authorLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let likesLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let repostLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let commentLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let numberOfViewstLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let textNewsLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let newsImageAuthor : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "icons8-socrates-50"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(newsImageAuthor)
        newsImageAuthor.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 40, enableInsets: false)
        addSubview(authorLabel)
        authorLabel.anchor(top: topAnchor, left: newsImageAuthor.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 40, enableInsets: false)
        addSubview(textNewsLabel)
        textNewsLabel.anchor(top: authorLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: bounds.size.width, height: 0, enableInsets: false)
        
        let stackView = UIStackView(arrangedSubviews: [likesLabel, repostLabel, commentLabel, numberOfViewstLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 2
        addSubview(stackView)
        stackView.anchor(top: textNewsLabel.bottomAnchor, left: newsImageAuthor.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 10, width: bounds.size.width / 2, height: 50, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
