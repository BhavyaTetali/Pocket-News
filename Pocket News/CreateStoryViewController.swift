//
//  CreateStoryViewController.swift
//  Pocket News
//
//  Created by Bhavya Tetali on 3/20/21.
//

import UIKit

class CreateStoryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var viewController : ViewController? = nil
    var pickerController = UIImagePickerController()

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var storyTitle: UITextField!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userStory: UITextView!
    
    @IBOutlet weak var storyImage: UIImageView!
    
    @IBOutlet weak var postButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userStory.layer.cornerRadius = 5
        userStory.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        userStory.layer.borderWidth = 1
        userStory.clipsToBounds = true;
        
        pickerController.delegate = self
        
        postButton.layer.cornerRadius = postButton.frame.size.height / 4
        
        self.view.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)

    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    //what to do after the user picks the image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedPic = info[.originalImage] as? UIImage{
            storyImage.image = selectedPic
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func tappedPost(_ sender: Any) {
        
        let news = News()
        news.title = storyTitle.text!
        news.author = userName.text!
        news.description = userStory.text!
        news.newsImage = storyImage.image!
        
        viewController?.newsFeedArray.append(news)
        // Pop this view controller.
        navigationController?.popViewController(animated: true)

        
    }
    
    @IBAction func uploadPic(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)

    }
   /*
    override func viewDidLayoutSubviews() {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(red: 0.00, green: 0.02, blue: 0.16, alpha: 1.00).cgColor, UIColor(red: 0.00, green: 0.31, blue: 0.57, alpha: 1.00).cgColor]
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        view.layer.insertSublayer(layer, at:0)
    }
    */

}
