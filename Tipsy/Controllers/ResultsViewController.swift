import UIKit

class ResultsViewController: UIViewController {
  @IBOutlet var totalLabel: UILabel!
  @IBOutlet var settingsLabel: UILabel!

  var bilPerPerson: Double?
  var tip: Double?
  var numberOfPeople: Int?

  override func viewDidLoad() {
    super.viewDidLoad()

    totalLabel.text = String(format: "%.2f", bilPerPerson ?? 0.0)
    settingsLabel.text = String(format: "Split between %d people, with %.0f%% tip", numberOfPeople!, (tip ?? 0.0) * 100)
  }

  @IBAction func recalculatePressed(_ sender: UIButton) {
    dismiss(animated: true)
  }
}
