/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - DetailViewController -

/// 詳細画面ビューコントローラ
class DetailViewController: UIViewController {
    
    /// アイコンフォントアイテム
    fileprivate(set) var item: IconFontItem!
    
    @IBOutlet fileprivate weak var headerView:              UIView!
    @IBOutlet fileprivate weak var iconLabel:               UILabel!
    @IBOutlet fileprivate weak var colorChangeTargetButton: UIButton!
    @IBOutlet fileprivate weak var prefixButton:            UIButton!
    @IBOutlet fileprivate weak var fileNameTextField:       UITextField!
    @IBOutlet fileprivate weak var suffixButton:            UIButton!
    @IBOutlet fileprivate weak var colorCaptionLabel:       UILabel!
    @IBOutlet fileprivate weak var colorCollectionView:     UICollectionView!
    @IBOutlet fileprivate weak var colorSegments:           UISegmentedControl!
    @IBOutlet fileprivate weak var colorButton:             UIButton!
    @IBOutlet fileprivate weak var sizeLabel:               UILabel!
    @IBOutlet fileprivate weak var sizeSlider:              UISlider!
    @IBOutlet fileprivate weak var generateButton:          UIButton!
    
    /// カラーピッカー
    fileprivate var colorPicker: ColorPickerViewController?
    
    /// 色コレクションビューのアダプタ
    fileprivate var colorCollectionAdapter: DetailColorCollectionViewController!
    
    /// 自身のインスタンスを生成する
    /// - parameter item: アイコンフォントアイテム
    /// - returns: 新しい自身のインスタンス
    class func create(item: IconFontItem) -> DetailViewController {
        let ret = App.Storyboard("Detail").get(DetailViewController.self)
        ret.item = item
        return ret
    }
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupIconLabel()
        self.setupFileName()
        self.setupFixes()
        self.setupColorComponents()
        self.setupSizeComponents()
        self.observeNotification(true)
    }
    
    deinit {
        self.observeNotification(false)
    }
    
    // MARK: - イベント
    
    /// 閉じるボタン押下時
    @IBAction private func didTapCloseButton() {
        self.dismiss()
    }
    
    /// カラー設定対象ボタン押下時
    @IBAction private func didTapColorChangeTargetButton() {
        self.colorChangeTarget = (self.colorChangeTarget == .icon) ? .background : .icon
    }
    
    /// 設定ボタン押下時
    @IBAction private func didTapSettingButton() {
        self.present(SettingViewController.create())
    }
    
    /// プレフィクスボタン押下時
    @IBAction private func didTapPrefixButton() {
        self.showSelectFixActionSheet(fix: .prefix) { [unowned self] selectedPrefix in
            self.prefix = selectedPrefix
        }
    }
    
    /// サフィックスボタン押下時
    @IBAction private func didTapSuffixButton() {
        self.showSelectFixActionSheet(fix: .suffix) { [unowned self] selectedSuffix in
            self.suffix = selectedSuffix
        }
    }
    
    /// ファイル名変更時
    @IBAction private func didEditChangeFileNameTextField() {
        self.updateGenerateButton()
    }
    
    /// カラー設定のセグメント変更時
    @IBAction private func didChangeColorSegment() {
        self.colorSegment = ColorSegment(rawValue: self.colorSegments.selectedSegmentIndex)!
    }
    
    /// カラーボタン押下時
    @IBAction private func didTapColorButton() {
        self.colorPicker = ColorPickerViewController.show(
            owner:          self,
            defaultColor:   self.currentColor,
            sourceView:     self.colorButton,
            arrowDirection: .down,
            saved: { [unowned self] color in
                App.Config.Color.add(color)
                self.colorCollectionView.reloadData()
            },
            commited: { [unowned self] color in
                self.currentColor = color
            },
            disappeared: { [unowned self] in
                self.colorPicker = nil
            }
        )
    }
    
    /// サイズスライダー変更時
    @IBAction private func didChangeSizeSlider() {
        self.currentSizeIndex = self.sizeSlider.value.int
    }
        
    /// 生成ボタン押下時
    @IBAction fileprivate func didTapGenerateButton() {
        
    }
    
    // MARK: - 通知イベント
    
    /// 通知監視の開始／停止
    private func observeNotification(_ start: Bool) {
        let items: [App.Notify.Item : String] = [
            .UpdateColorHistories     : "didUpdateColorHistories",
            .ChangeImageSizeCandidate : "didChangeImageSizeCandidate",
            .ChangeIconColor          : "didChangeIconColor",
            .ChangeBackgroundColor    : "didChangeBackgroundColor",
            ]
        if start {
            App.Notify.addItems(self, items)
        } else {
            App.Notify.removeItems(self, items.map { $0.key })
        }
    }
    
    /// カラー履歴が更新された時
    @objc fileprivate func didUpdateColorHistories() {
        self.colorCollectionView.reloadData()
    }
    
    @objc fileprivate func didChangeIconColor() {
        self.updateColorComponents()
    }
    
    @objc fileprivate func didChangeBackgroundColor() {
        self.updateColorComponents()
    }
    
    @objc fileprivate func didChangeImageSizeCandidate() {
        self.updateSizeComponents()
    }
    
    // MARK: - プロパティ
    
    fileprivate var currentSizeIndex: Int = 0 {
        didSet { self.setCurrentSizeIndex(self.currentSizeIndex) }
    }
}

// MARK: - アイコンラベル -
extension DetailViewController {
    
    /// アイコンラベルのセットアップ
    fileprivate func setupIconLabel() {
        self.iconLabel.font = App.Config.Latest.iconFont.set.font(self.iconLabel.font.pointSize)
        self.iconLabel.text = self.item.text
    }
}

// MARK: - ファイル名 -
extension DetailViewController: UITextFieldDelegate {
    
    /// ファイル名のセットアップ
    fileprivate func setupFileName() {
        let text = App.Config.Default.shouldUseLatestFileName ? App.Config.Latest.fileName : self.item.name
        self.fileName = text
        
        self.fileNameTextField.delegate = self
    }
    
    /// ファイル名
    fileprivate var fileName: String {
        get { return self.fileNameTextField.text ?? "" }
        set(v) {
            self.fileNameTextField.text = v
            self.updateGenerateButton()
        }
    }
    
    /// ファイル名(プレフィックスとサフィックスを含めたフルネーム)
    fileprivate var fileFullName: String {
        return "\(self.prefix)\(self.fileName)\(self.suffix)".trim(.whitespacesAndNewlines)
    }
    
    /// キーボードリターンキー押下時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - プレフィックス / サフィックス -
extension DetailViewController {
    
    fileprivate func setupFixes() {
        self.prefix = App.Config.Latest.prefix
        self.suffix = App.Config.Latest.suffix
    }
    
    /// プレフィックス
    fileprivate var prefix: String {
        get { return self.buttonTitle(fix: .prefix) }
        set(v) {
            self.setButtonTitle(v, fix: .prefix)
            App.Config.Latest.prefix = v
            self.updateGenerateButton()
        }
    }
    
    /// サフィックス
    fileprivate var suffix: String {
        get { return self.buttonTitle(fix: .suffix) }
        set(v) {
            self.setButtonTitle(v, fix: .suffix)
            App.Config.Latest.suffix = v
            self.updateGenerateButton()
        }
    }
    
    /// ボタンのタイトルを取得する
    /// - parameter fix: プレフィックス/サフィックス
    /// - returns: ボタンのタイトル
    fileprivate func buttonTitle(fix: FixMode) -> String {
        return self.button(fix: fix).title ?? ""
    }
    
    /// ボタンのタイトルを設定する
    /// - parameter text: ボタンのタイトル
    /// - parameter fix: プレフィックス/サフィックス
    fileprivate func setButtonTitle(_ text: String, fix: FixMode) {
        let button = self.button(fix: fix)
        button.titleColor = text.isEmpty ? App.Color.DisabledButtonColor : App.Color.DefaultIconColor
        button.title      = text.isEmpty ? " " : text
    }
    
    /// プレフィクス/サフィックス選択用のアクションシートを表示する
    /// - parameter fix: プレフィックス/サフィックス
    /// - parameter selected: 選択時の処理
    fileprivate func showSelectFixActionSheet(fix: FixMode, selected: @escaping (String) -> ()) {
        var actions = self.fixes(fix).map { text in
            return UIAlertAction(text) {
                selected(text)
            }
        }
        actions.append(UIAlertAction(destructive: "cancel".localize()))
        
        NBActionSheet.show(self, actions: actions)
    }
    
    /// プレフィクスボタン/サフィックスボタンを取得する
    /// - parameter fix: プレフィックス/サフィックス
    /// - returns: ボタンの参照
    private func button(fix: FixMode) -> UIButton {
        switch fix {
        case .prefix: return self.prefixButton
        case .suffix: return self.suffixButton
        }
    }
    
    /// 保存されているプレフィクス/サフィックスの候補を配列で取得する
    /// - parameter fix: プレフィックス/サフィックス
    /// - returns: 保存されている候補文字列の配列
    private func fixes(_ fix: FixMode) -> [String] {
        switch fix {
        case .prefix: return App.Config.Fixes.prefixes
        case .suffix: return App.Config.Fixes.suffixes
        }
    }
}

// MARK: - 色 -
extension DetailViewController {
    
    fileprivate func setupColorComponents() {
        self.colorCollectionAdapter = DetailColorCollectionViewController(colorSegment: App.Config.Latest.colorSegment) { [unowned self] color in
            self.currentColor = color
        }
        self.colorCollectionAdapter.setup(self.colorCollectionView)
        
        self.colorSegment      = App.Config.Latest.colorSegment
        self.colorChangeTarget = App.Config.Latest.colorChangeTarget
    }
    
    /// カラー関係コンポーネントの表示を更新する
    fileprivate func updateColorComponents() {
        self.colorButton.title = "#\(self.currentColor.rgbString)"
        self.iconLabel .textColor       = App.Config.ThemeColor.iconColor
        self.iconLabel .backgroundColor = App.Config.ThemeColor.backgroundColor
        self.headerView.backgroundColor = App.Config.ThemeColor.backgroundColor
    }
    
    /// カラー設定対象
    fileprivate var colorChangeTarget: ColorChangeTarget {
        get {
            return self.colorChangeTargetButton.isSelected ? .background : .icon
        }
        set(v) {
            let icon = (v == .icon)
            self.colorChangeTargetButton.isSelected = !icon
            self.colorCaptionLabel.text = " \( icon ? "ICON COLOR" : "BACKGROUND COLOR" )"
            self.updateColorComponents()
            App.Config.Latest.colorChangeTarget = v
        }
    }
    
    /// カラー設定のセグメント種別
    fileprivate var colorSegment: ColorSegment {
        get {
            return ColorSegment(rawValue: self.colorSegments.selectedSegmentIndex)!
        }
        set(v) {
            self.colorSegments.selectedSegmentIndex = v.hashValue
            self.colorCollectionAdapter.colorSegment = v
            App.Config.Latest.colorSegment = v
        }
    }
    
    /// 現在のカラー設定の保存/取得
    var currentColor: UIColor {
        get {
            switch self.colorChangeTarget {
            case .icon:       return App.Config.ThemeColor.iconColor
            case .background: return App.Config.ThemeColor.backgroundColor
            }
        }
        set(v) {
            switch self.colorChangeTarget {
            case .icon:
                App.Config.ThemeColor.iconColor = v
                App.Notify.post(to: .ChangeIconColor)
            case .background:
                App.Config.ThemeColor.backgroundColor = v
                App.Notify.post(to: .ChangeBackgroundColor)
            }
            self.updateColorComponents()
        }
    }
}

// MARK: - サイズ -
extension DetailViewController {
    
    /// サイズ関係コンポーネントをセットアップ
    fileprivate func setupSizeComponents() {
        self.updateSizeComponents()
    }
    
    /// サイズ関係コンポーネントの表示を更新する
    fileprivate func updateSizeComponents() {
        let candidates = App.Config.Latest.imageSizeCandidate.candidates
        let size       = App.Config.Latest.imageSize
        
        self.sizeSlider.minimumValue = 0
        self.sizeSlider.maximumValue = Float(candidates.count)
        
        self.currentSizeIndex = candidates.index(of: size) ?? 0
    }
    
    /// 現在のサイズのインデックスを設定する
    /// このメソッドは self.currentSizeIndex に代入する時に走る
    /// - parameter index: インデックス
    fileprivate func setCurrentSizeIndex(_ index: Int) {
        let candidates = App.Config.Latest.imageSizeCandidate.candidates
        let i = candidates.indexInRange(for: index)
        let size = candidates[i]
        
        self.sizeLabel.text = "\(size)px"
        self.sizeSlider.value = i.float
        
        App.Config.Latest.imageSize = size
    }
}

// MARK: - 生成 -
extension DetailViewController {
    
    /// 生成ボタンの使用可/不可を判定してUI更新を行う
    fileprivate func updateGenerateButton() {
        if self.isEnabledGenerateButton {
            self.generateButton.isEnabled = true
            self.generateButton.backgroundColor = App.Color.PositiveButtonColor
        } else {
            self.generateButton.isEnabled = false
            self.generateButton.backgroundColor = App.Color.DisabledButtonColor
        }
    }
    
    /// 生成ボタンの使用可/不可
    fileprivate var isEnabledGenerateButton: Bool {
        
        // ファイル名が設定されていなければ不可
        if self.fileFullName.isEmpty {
            return false
        }
        
        return true
    }
    
    /// 生成処理を行う
    fileprivate func generate() {
        
    }
}
