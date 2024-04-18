import UIKit

class CalculateViewController: UIViewController {
  @IBOutlet var billTextField: UITextField!
  @IBOutlet var zeroPctButton: UIButton!
  @IBOutlet var tenPctButton: UIButton!
  @IBOutlet var twentyPctButton: UIButton!
  @IBOutlet var splitNumberLabel: UILabel!
  @IBOutlet var splitNumberSelector: UIStepper!

  var billPerPerson = 0.0

  @IBAction func tipChanged(_ sender: UIButton) {
    billTextField.endEditing(true)

    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false

    sender.isSelected = true
  }

  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    billTextField.endEditing(true)

    splitNumberLabel.text = String(format: "%.0f", sender.value)
  }

  @IBAction func calculatePressed(_ sender: UIButton) {
    guard let bill = billTextField.text else { return }
    if bill == "" { return }

    let total = Double(bill)!
    let tip = getTip()
    let split = splitNumberSelector.value

    billPerPerson = (total + total * tip) / split

    performSegue(withIdentifier: "goToResults", sender: self)
  }

  func getTip() -> Double {
    return if zeroPctButton.isSelected {
      0.0
    } else if tenPctButton.isSelected {
      0.1
    } else {
      0.2
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResults" {
      let destinationVC = segue.destination as! ResultsViewController
      destinationVC.bilPerPerson = billPerPerson
      destinationVC.tip = getTip()
      destinationVC.numberOfPeople = Int(splitNumberSelector.value)
    }
  }
}
