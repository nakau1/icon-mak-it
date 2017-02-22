/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - ColorPickerViewController -

/// カラーピッカービューコントローラ
class ColorPickerViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    typealias ColorPickerHandler = (UIColor) -> Void
    
    @IBOutlet fileprivate weak var redIntegerLabel:   UILabel!
    @IBOutlet fileprivate weak var redFloatLabel:     UILabel!
    @IBOutlet fileprivate weak var redSlider:         UISlider!
    @IBOutlet fileprivate weak var greenIntegerLabel: UILabel!
    @IBOutlet fileprivate weak var greenFloatLabel:   UILabel!
    @IBOutlet fileprivate weak var greenSlider:       UISlider!
    @IBOutlet fileprivate weak var blueIntegerLabel:  UILabel!
    @IBOutlet fileprivate weak var blueFloatLabel:    UILabel!
    @IBOutlet fileprivate weak var blueSlider:        UISlider!
    @IBOutlet fileprivate weak var colorLabel:        UILabel!
    
    /// 現在の色
    fileprivate var color: UIColor!
    
    /// 保存ボタン押下時ハンドラ
    fileprivate var saveColorHandler: ColorPickerHandler!
    
    /// 確定ボタン押下時ハンドラ
    fileprivate var commitColorHandler: ColorPickerHandler!
    
    /// ポップアップ表示を閉じ終えた時のハンドラ
    fileprivate var disappearHandler: VoidClosure!
    
    /// 自身のインスタンスを生成する
    /// - returns: 新しい自身のインスタンス
    class func create() -> ColorPickerViewController {
        let ret = App.Storyboard("ColorPicker").get(ColorPickerViewController.self)
        return ret
    }
    
    // MARK: ポップアップ表示
    
    /// カラーピッカーをポップアップ表示する
    /// - parameter owner: 表示元のビューコントローラ
    /// - parameter defaultColor: 色の初期値
    /// - parameter sourceView: 吹き出しの表示元
    /// - parameter arrowDirection: 吹き出しの位置
    /// - parameter saved: 保存ボタン押下時ハンドラ
    /// - parameter commited: 確定ボタン押下時ハンドラ
    /// - parameter disappeared: ポップアップ表示を閉じ終えた時のハンドラ
    /// - returns: カラーピッカーの参照
    class func show(
        owner:          UIViewController,
        defaultColor:   UIColor,
        sourceView:     UIView,
        arrowDirection: UIPopoverArrowDirection,
        saved:          @escaping ColorPickerHandler,
        commited:       @escaping ColorPickerHandler,
        disappeared:    @escaping VoidClosure
        ) -> ColorPickerViewController
    {
        let vc = self.create()
        vc.color              = defaultColor
        vc.saveColorHandler   = saved
        vc.commitColorHandler = commited
        vc.disappearHandler   = disappeared
        
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize   = vc.view.bounds.size
        
        if let ppc = vc.popoverPresentationController {
            ppc.backgroundColor = vc.view.backgroundColor
            ppc.permittedArrowDirections = arrowDirection
            ppc.sourceView = sourceView
            ppc.sourceRect = sourceView.bounds
            ppc.delegate = vc
        }
        
        owner.present(vc, animated: true) {}
        
        return vc
    }
    
    // おまじない
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateComponents(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.disappearHandler()
    }
    
    // MARK: UI更新
    
    /// 各UIコンポーネントを更新する
    /// - parameter updateSlider: スライダーの値を更新するかどうか
    fileprivate func updateComponents(_ updateSlider: Bool = false) {
        let i = self.color.intValues
        let f = self.color.floatValues
        
        if updateSlider {
            self.redSlider  .value = Float(i.red)
            self.greenSlider.value = Float(i.green)
            self.blueSlider .value = Float(i.blue)
        }
        
        self.redIntegerLabel  .text = "\(i.red)"
        self.greenIntegerLabel.text = "\(i.green)"
        self.blueIntegerLabel .text = "\(i.blue)"
        
        self.redFloatLabel  .text = "%.03f".format(f.red)
        self.greenFloatLabel.text = "%.03f".format(f.green)
        self.blueFloatLabel .text = "%.03f".format(f.blue)
        
        self.colorLabel.backgroundColor = self.color
        self.colorLabel.text = "#\(self.color.rgbString)"
    }
    
    /// 各スライダーの値から計算された色
    fileprivate var colorBySliderValues: UIColor {
        let i = self.sliderValues
        return UIColor(i.red, i.green, i.blue, 255)
    }
    
    /// 各スライダーの整数値をタプルで返す
    /// - returns: タプル (red: R値(0-255), green: G値(0-255), blue: B値(0-255))
    private var sliderValues: (red: Int, green: Int, blue: Int) {
        return (
            Int(self.redSlider  .value),
            Int(self.greenSlider.value),
            Int(self.blueSlider .value)
        )
    }
    
    // MARK: ボタンイベント
    
    /// 保存ボタン押下時
    @IBAction fileprivate func didTapSaveButton() {
        self.saveColorHandler(self.color)
    }
    
    /// 確定ボタン押下時
    @IBAction fileprivate func didTapCommitButton() {
        self.commitColorHandler(self.color)
        self.dismiss()
    }
    
    // MARK: スライダーイベント
    
    /// 赤色スライダーの値が変わった時
    @IBAction fileprivate func didChangeRedSlider() {
        self.color = self.colorBySliderValues
        self.updateComponents()
    }
    
    /// 緑色スライダーの値が変わった時
    @IBAction fileprivate func didChangeGreenSlider() {
        self.color = self.colorBySliderValues
        self.updateComponents()
    }
    
    /// 青色スライダーの値が変わった時
    @IBAction fileprivate func didChangeBlueSlider() {
        self.color = self.colorBySliderValues
        self.updateComponents()
    }
}
