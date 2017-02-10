/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - SliderView -

/// スライダービュークラス
@IBDesignable class SliderView: UIView {
    
    /// スライダー
    weak var slider: UISlider!
    
    /// マイナスボタン
    weak var minusButton: UIButton!
    
    /// プラスボタン
    weak var plusButton: UIButton!
    
    /// フォアグラウンド色
    @IBInspectable var foregroundColor: UIColor! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    fileprivate var isInitialized = false
}

// MARK: - プライベート -
extension SliderView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !self.isInitialized {
            self.initialize()
            self.isInitialized = true
        }
        
        self.setupButtonColor(self.minusButton)
        self.setupButtonColor(self.plusButton)
    }
    
    
    fileprivate func initialize() {
        let minus  = self.createMinusButton()
        let plus   = self.createPlusButton()
        let slider = self.createSlider()
        
        for v in [minus, plus, slider] {
            v.prepareConstraints()
            self.addSubview(v)
        }
        
        let constraints: [NSLayoutConstraint] = [
            //
            Constraint(minus,  .top,      to: self,  .top,       5),
            Constraint(minus,  .leading,  to: self,  .leading,   5),
            Constraint(minus,  .bottom,   to: self,  .bottom,   -5),
            Constraint(minus,  .width,    to: minus, .height,    0),
            //
            Constraint(plus,   .trailing, to: self,  .trailing,  0),
            Constraint(plus,   .top,      to: minus, .top,       0),
            Constraint(plus,   .bottom,   to: minus, .bottom,    0),
            Constraint(plus,   .width,    to: minus, .width,     0),
            // 
            Constraint(slider, .leading,  to: minus, .trailing,  5),
            Constraint(slider, .trailing, to: plus,  .leading,  -5),
            Constraint(slider, .centerY,  to: self,  .centerY,   0),
            ]
        
        self.addConstraints(constraints)
        
        self.slider      = slider
        self.minusButton = minus
        self.plusButton  = plus
    }
    
    fileprivate func createSlider() -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1; slider.maximumValue = 100; slider.value = 50
        
        if let color = self.foregroundColor {
            slider.thumbTintColor = color
            slider.minimumTrackTintColor = color
            slider.maximumTrackTintColor = UIColor.clear
        }
        return slider
    }
    
    fileprivate func createPlusButton() -> UIButton {
        let btn = UIButton()
        btn.setTitle("+", for: UIControlState())
        self.setupButtonColor(btn)
        return btn
    }
    
    fileprivate func createMinusButton() -> UIButton {
        let btn = UIButton()
        btn.setTitle("-", for: UIControlState())
        self.setupButtonColor(btn)
        return btn
    }
    
    fileprivate func setupButtonColor(_ button: UIButton) {
        button.layer.cornerRadius = button.bounds.width / 2
        button.layer.borderWidth = 1.0
        if let color = self.foregroundColor {
            button.layer.borderColor = color.cgColor
            button.setTitleColor(color, for: UIControlState())
        }
    }
}
