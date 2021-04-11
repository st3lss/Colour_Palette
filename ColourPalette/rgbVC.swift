//
//  rgbVC.swift
//  ColourPalette
//
//  Created by Tamerlan on 10.04.2021.
//

import UIKit


class rgbVC: UIViewController {
    
    // MARK: - IB Outlet
    @IBOutlet var viewMain: UIView!
    
    // MARK: - Public properties
    var redLigtSlider: Float = 0.0
    var greenLightSlider: Float = 0.0
    var blueLightSlider: Float = 0.0
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setBG()
    }
    
    // MARK: - Override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let setColor = segue.destination as! setColorVC
        setColor.red = redLigtSlider
        setColor.green = greenLightSlider
        setColor.blue = blueLightSlider
        setColor.delegate = self
    }
}

    // MARK: - Deligate
extension rgbVC: SettingsViewControllerDelegate {
    func sendNewValues(for red: Float, for green: Float, for blue: Float) {
        redLigtSlider = red
        greenLightSlider = green
        blueLightSlider = blue

        setBG()
    }
}

 // MARK: - Private methods
extension rgbVC {
    private func setBG() {
        viewMain.backgroundColor = UIColor(red: CGFloat(redLigtSlider), green: CGFloat(greenLightSlider), blue: CGFloat(blueLightSlider), alpha: 1.0)
    }
}
