//
//  setColorVC.swift
//  ColourPalette
//
//  Created by Tamerlan on 26.03.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func sendNewValues(for red: Float, for green: Float, for blue: Float)
}

class setColorVC: UIViewController {
    
    // MARK: - IB Outlet
    @IBOutlet var valueRedColorLabel: UILabel!
    @IBOutlet var valueGreenColorLabel: UILabel!
    @IBOutlet var valueBlueColorLabel: UILabel!
    
    @IBOutlet var redLigtSlider: UISlider!
    @IBOutlet var greenLightSlider: UISlider!
    @IBOutlet var blueLightSlider: UISlider!
    
    @IBOutlet var screenView: UIView!
    
    // MARK: - Public properties
    var delegate: SettingsViewControllerDelegate!
    
    var red: Float = 0.0
    var green: Float = 0.0
    var blue: Float = 0.0
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueRedColorLabel.text = String(format: "%.2f",red)
        valueGreenColorLabel.text = String(format: "%.2f",green)
        valueBlueColorLabel.text = String(format: "%.2f",blue)
        
        redLigtSlider.value = red
        greenLightSlider.value = green
        blueLightSlider.value = blue
        
        rgbSet(for: red, for: green, for: blue)
    }
    
    // MARK: - IB Action
    @IBAction func setRedSlider() {
        valueRedColorLabel.text = String(format: "%.2f",redLigtSlider.value)
        rgbSet(for: redLigtSlider.value, for: greenLightSlider.value, for: blueLightSlider.value)
    }
    
    @IBAction func setGreenSlider() {
        valueGreenColorLabel.text = String(format: "%.2f",greenLightSlider.value)
        rgbSet(for: redLigtSlider.value, for: greenLightSlider.value, for: blueLightSlider.value)
    }
    
    @IBAction func setBlueSlider() {
        valueBlueColorLabel.text = String(format: "%.2f",blueLightSlider.value)
        rgbSet(for: redLigtSlider.value, for: greenLightSlider.value, for: blueLightSlider.value)
    }
    
    @IBAction func pressDoneButton() {
        red = redLigtSlider.value
        green = greenLightSlider.value
        blue = blueLightSlider.value
        delegate.sendNewValues(for: red, for: green, for: blue)
        
        dismiss(animated: true)
    }
    
}

// MARK: - Private methods
extension setColorVC {
    private func rgbSet(for red: Float, for green: Float, for blue: Float) {
        screenView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
}


