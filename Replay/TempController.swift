//
//  TempController.swift
//  Replay
//
//  Created by Jason Ngo on 2018-09-22.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

import AVKit                // access: AVPlayer - object that plays selected video
import MobileCoreServices   // access: Pre-defined constants needed when selecting videos

// Temp controll to figure out AVFoundation

class TempController: UIViewController {
    
    let selectAndPlayVideoButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Select and play video", for: .normal)
        button.addTarget(self, action: #selector(handleSelectAndPlayPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func handleSelectAndPlayPressed() {
        print("handleSelectAndPlayPressed called")
        // Ensure we can view the saved photos album
        guard UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) else { return }
        
        let mediaUI = UIImagePickerController()
        mediaUI.sourceType = .savedPhotosAlbum
        mediaUI.mediaTypes = [kUTTypeMovie as String]
        mediaUI.allowsEditing = true
        mediaUI.delegate = self
        
        present(mediaUI, animated: true, completion: nil)
    }
    
    let recordAndSaveButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Record and save video", for: .normal)
        button.addTarget(self, action: #selector(handleRecordAndSavePressed), for: .touchUpInside)
        return button
    }()
    
    @objc func handleRecordAndSavePressed() {
        print("handleRecordAndSavePressed called")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - UIImagePickerControllerDelegate
// Allow users to pick video from photos library
extension TempController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Make sure we have the correct media type and unwrap the url
        guard
            let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String,
            mediaType == (kUTTypeMovie as String),
            let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL
        else {
            return
        }
        
        // dismiss the imagePicker and load the avplayer view
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            let player = AVPlayer(url: url)
            let vcPlayer = AVPlayerViewController()
            vcPlayer.player = player
            self.present(vcPlayer, animated: true, completion: nil)
        }
    }
}

// MARK: - UINavigationControllerDelegate
extension TempController: UINavigationControllerDelegate {
    
}


// MARK: - Helpers
private extension TempController {
    func setupViews() {
        let stackView = UIStackView(arrangedSubviews: [selectAndPlayVideoButton, recordAndSaveButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
