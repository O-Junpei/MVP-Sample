import Foundation

protocol PresenterInput {
    func textDidChange(leftText: String, rightText: String)
    func resultButtonOnTap(leftText: String, rightText: String)
}

protocol PresenterOutput {
    func changeResultButtonEnable(isEnable: Bool)
    func setResultLabel(text: String)
    func showErrorAlert(title: String, message: String)
}

class Presenter: PresenterInput {
    let view: PresenterOutput
    let model: ModelInput
    
    init(view: PresenterOutput, model: ModelInput) {
        self.view = view
        self.model = model
    }
    
    func textDidChange(leftText: String, rightText: String) {
        if leftText.isEmpty || rightText.isEmpty {
            view.changeResultButtonEnable(isEnable: false)
        } else {
            view.changeResultButtonEnable(isEnable: true)
        }
    }
    
    func resultButtonOnTap(leftText: String, rightText: String) {
        guard let leftNumber = Float(leftText), let rightNumber = Float(rightText) else {
            view.showErrorAlert(title: "エラー", message: "数字を入れてください")
            return
        }
        view.setResultLabel(text: String(format: "%.1f", model.multiply(leftNumber, rightNumber)))
    }
}
