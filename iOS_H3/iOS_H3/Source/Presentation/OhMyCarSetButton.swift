//
//  OhMyCarSetButton.swift
//  iOS_H3_UI
//
//  Created by  sangyeon on 2023/08/03.
//

import UIKit

final class OhMyCarSetButton: UIButton {

    enum ColorType {
        case mainHyundaiBlue
        case white
        case coolGrey1
        case grey   // color 새로 정의 필요할듯 (프론트까지 같이 얘기해서?)

        var backgroundColor: UIColor {
            switch self {
            case .mainHyundaiBlue: return Colors.mainHyundaiBlue
            case .white: return .white
            case .coolGrey1: return Colors.coolGrey1
            case .grey: return UIColor(hex: "#E8E8E8") ?? .red
            }
        }

        var titleColor: UIColor {
            switch self {
            case .mainHyundaiBlue: return .white
            case .white: return .black
            case .coolGrey1: return Colors.mainHyundaiBlue
            case .grey: return Colors.mainHyundaiBlue
            }
        }

        var hasBorder: Bool {
            switch self {
            case .white: return true
            default: return false
            }
        }
    }

    // MARK: - UI properties

    enum Constants {
        static let cornerRadius = 6.0
    }

    // MARK: - Lifecycles

    init(colorType: ColorType, title: String) {
        super.init(frame: .zero)
        
        setupViews(for: colorType)
        setTitle(title, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews(for: .mainHyundaiBlue)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews(for: .mainHyundaiBlue)
    }

    // MARK: - Helpers

    func changeColor(titleColor: UIColor, backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
    }

    func addBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }

    func setupDisabledView() {
        changeColor(titleColor: Colors.coolGrey3, backgroundColor: Colors.coolGrey1)
    }
}

extension OhMyCarSetButton {
    private func setupViews(for colorType: ColorType) {
        setupRadius()
        setupLabelFont()
        setupViewsForType(colorType)
    }

    private func setupRadius() {
        self.layer.cornerRadius = Constants.cornerRadius
    }

    private func setupLabelFont() {
        titleLabel?.font = Fonts.mediumBody2
        titleLabel?.setupLineHeight(FontLineHeights.mediumBody2)
        titleLabel?.setupLetterSpacing(FontLetterSpacings.mediumBody2)
    }

    private func setupViewsForType(_ colorType: ColorType) {
        backgroundColor = colorType.backgroundColor
        setTitleColor(colorType.titleColor, for: .normal)
        if colorType.hasBorder {
            addBorder(width: 1, color: .black)
        }
    }
}
