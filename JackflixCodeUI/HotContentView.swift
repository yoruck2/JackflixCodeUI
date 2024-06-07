//
//  HotContentView.swift
//  JackflixCodeUI
//
//  Created by dopamint on 6/6/24.
//

import UIKit

class HotContentView: UIView {
    
    lazy var posterImageView = {
        let view = UIImageView()
        view.image = UIImage(named: MovieData.randomMovie())
        return view
    }()
    
    lazy var top10Image = {
        let view = UIImageView()
        view.image = UIImage(named: "top10 badge")
        view.isHidden = .random()
        return view
    }()
    
    lazy var newEpisodStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [newEpisodLabel, playNowLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.isHidden = .random()
        return stackView
    }()
    
    lazy var newEpisodLabel = {
        let view = UILabel()
        view.text = "새로운 에피소드"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 12)
        view.textColor = .white
        view.backgroundColor = UIColor(named: "keyColor")
        return view
    }()
    
    lazy var playNowLabel = {
        let view = UILabel()
        view.text = "지금 시청하기"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 12)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var newSeriesLabel = {
        let view = UILabel()
        view.text = "새로운 시리즈"
        view.font = .systemFont(ofSize: 12)
        view.textAlignment = .center
        view.backgroundColor = .white
        view.sendSubviewToBack(newEpisodStackView)
        view.isHidden = .random()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierachy()
        configureLayout()
//        updateConstraints()
//        updateConstraintsIfNeeded()
//        needsUpdateConstraints()
//        setNeedsLayout()
//        setNeedsDisplay()
//        setNeedsUpdateConstraints()
//        layoutIfNeeded()
        
        print("생성됨")
        print("-----------")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierachy() {
        addSubview(posterImageView)
        addSubview(top10Image)
        addSubview(newSeriesLabel)
        addSubview(newEpisodStackView)
        }
    
    func configureLayout() {
         
        newSeriesLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        posterImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        top10Image.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.width.equalTo(22)
            make.height.equalTo(31)
        }
        
        newEpisodStackView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.18)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            
        }
        
        playNowLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }
}
