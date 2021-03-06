//
//  MainViewController.swift
//  SWGauge
//
//  Created by Petr Korolev on 21/05/15.
//  Copyright (c) 2015 Petr Korolev. All rights reserved.
//

import UIKit
import GaugeKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gauge.colorsArray = [UIColor.redColor(), UIColor.orangeColor(), UIColor.yellowColor() ,UIColor.greenColor()]
    }

    @IBOutlet var allGauges: [Gauge]!
//    @IBOutlet var scaleLabel: UILabel!
    @IBOutlet var gauge: Gauge!
    @IBOutlet var gaugeSmall: Gauge!
    @IBOutlet var leftGauge: Gauge!
    @IBOutlet var rightGauge: Gauge!
    @IBOutlet var lineGauge: Gauge!
    @IBAction func sliderChanged(sender: UISlider) {
        gauge.rate = CGFloat(sender.value)
        gaugeSmall.rate = CGFloat(sender.value)
        leftGauge.rate = CGFloat(sender.value)
        rightGauge.rate = CGFloat(sender.value)
        lineGauge.rate = CGFloat(sender.value)

//        scaleLabel.text = "\(sender.value)"
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }

    @IBAction func animateAction(sender: AnyObject) {
        for gauge in self.allGauges {
            let newRate : CGFloat = gauge.rate == 0.0 ? 10.0 : 0.0

            gauge.animateRate(5.0, newValue: newRate) { (finished) in
                print("Gauge animation completed !")
            }
        }
    }

    @IBAction func switchChanged(sender: UISwitch) {
        gauge.reverse = sender.on
        leftGauge.reverse = sender.on
        rightGauge.reverse = sender.on
        lineGauge.reverse = sender.on

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
