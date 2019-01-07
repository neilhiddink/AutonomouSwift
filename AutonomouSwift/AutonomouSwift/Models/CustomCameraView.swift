//
//  CustomCameraView.swift
//  AutonomouSwift
//
//  Created by Neil Hiddink on 1/6/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit
import AVKit

class CustomCameraView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Start up the camera
        
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo

        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.layer.addSublayer(previewLayer)
        previewLayer.frame = self.bounds
        previewLayer.connection?.videoOrientation = .landscapeRight
    }
    
}
