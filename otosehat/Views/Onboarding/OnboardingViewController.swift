//
//  OnboardingViewController.swift
//  otosehat
//
//  Created by Nicky Santano on 04/04/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var onboardingCV: UICollectionView!
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet{
            pageCtrl.currentPage = currentPage
            if currentPage == slides.count-1{
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slides = [
                    OnboardingSlide(title: "Any Vehicle", description: "You don't have to worry about what vehicle you having.", image: #imageLiteral(resourceName: "vehicles-gef9e1e385_1280")),
                    OnboardingSlide(title: "We'll Remind You", description: "Busy all day? Don't worry, we will keep in touch with you.", image: #imageLiteral(resourceName: "message-papers-g57fa89173_1280")),
                    OnboardingSlide(title: "It's On Your Hand", description: "Don't worry, We are here to help you from your hand.", image: #imageLiteral(resourceName: "smartphone-g5579ee994_1280"))
                ]
        
    }

    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            let controller = storyboard?
                .instantiateViewController(withIdentifier: "HomeNavController") as! UIViewController
            
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            
            present(controller, animated: true, completion: nil)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        
        

    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath)
            as! OnboardingCollectionViewCell
        cell.setup(slide: slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
}
