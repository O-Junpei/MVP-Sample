import XCTest
@testable import MVP

class MVPTests: XCTestCase {
    
    func testExample() {
        
        class MockView: PresenterOutput {
            var presenter: PresenterInput!
            
            var buttonEnable: Bool = false
            var resultText: String = ""
            
            func inject(presenter: PresenterInput) {
                self.presenter = presenter
            }
            
            func changeResultButtonEnable(isEnable: Bool) {
                buttonEnable = isEnable
            }
            
            func setResultLabel(text: String) {
                resultText = text
            }
            
            func showErrorAlert(title: String, message: String) {
                print(title, message)
            }
        }
        
        let view = MockView()
        let model: ModelInput = Model()
        let presenter: PresenterInput = Presenter(view: view, model: model)
        view.inject(presenter: presenter)
        
        presenter.textDidChange(leftText: "4", rightText: "4")
        XCTAssertTrue(view.buttonEnable)
        
        presenter.resultButtonOnTap(leftText: "4", rightText: "4")
        XCTAssertEqual(view.resultText, "16.0")
    }
}
