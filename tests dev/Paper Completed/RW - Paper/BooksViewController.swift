/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class BooksViewController: UICollectionViewController {
	
  var transition: BookOpeningTransition?
  
  //1
  var interactionController: UIPercentDrivenInteractiveTransition?
  //2
  var recognizer: UIGestureRecognizer? {
    didSet {
      if let recognizer = recognizer {
        collectionView?.addGestureRecognizer(recognizer)
      }
    }
  }
  
	var books: Array<Book>? {
		didSet {
			collectionView?.reloadData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		books = BookStore.sharedInstance.loadBooks("Books")
    
    recognizer = UIPinchGestureRecognizer(target: self, action: "handlePinch:")
	}
  
  // MARK: Gesture recognizer action
  func handlePinch(recognizer: UIPinchGestureRecognizer) {
    switch recognizer.state {
    case .Began:
      //1
      interactionController = UIPercentDrivenInteractiveTransition()
      //2
      if recognizer.scale >= 1 {
        //3
        if recognizer.view == collectionView {
          //4
          var book = self.selectedCell()?.book
          //5
          self.openBook(book)
        }
        //6
      } else {
        //7
        navigationController?.popViewControllerAnimated(true)
      }
    case .Changed:
      //1
      if transition!.isPush {
        //2
        var progress = min(max(abs((recognizer.scale - 1)) / 5, 0), 1)
        //3
        interactionController?.updateInteractiveTransition(progress)
        //4
      } else {
        //5
        var progress = min(max(abs((1 - recognizer.scale)), 0), 1)
        //6
        interactionController?.updateInteractiveTransition(progress)
      }
    case .Ended:
      //1
      interactionController?.finishInteractiveTransition()
      //2
      interactionController = nil
    default:
      break
    }
  }
	
	// MARK: Helpers
	
	func selectedCell() -> BookCoverCell? {
		if let indexPath = collectionView?.indexPathForItemAtPoint(CGPointMake(collectionView!.contentOffset.x + collectionView!.bounds.width / 2, collectionView!.bounds.height / 2)) {
			if let cell = collectionView?.cellForItemAtIndexPath(indexPath) as? BookCoverCell {
				return cell
			}
		}
		return nil
	}
	
  func openBook(book: Book?) {
    let vc = storyboard?.instantiateViewControllerWithIdentifier("BookViewController") as! BookViewController
    vc.book = selectedCell()?.book
    //1
    vc.view.snapshotViewAfterScreenUpdates(true)
    //2
    dispatch_async(dispatch_get_main_queue(), { () -> Void in
      self.navigationController?.pushViewController(vc, animated: true)
      return
    })
  }
}

// MARK: UICollectionViewDelegate

extension BooksViewController: UICollectionViewDelegate {
	
	override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		var book = books?[indexPath.row]
		openBook(book)
	}
	
}

// MARK: UICollectionViewDataSource

extension BooksViewController: UICollectionViewDataSource {
	
	override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if let books = books {
			return books.count
		}
		return 0
	}
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		var cell = collectionView .dequeueReusableCellWithReuseIdentifier("BookCoverCell", forIndexPath: indexPath) as! BookCoverCell
		
		cell.book = books?[indexPath.row]
		
		return cell
	}
	
}

extension BooksViewController {
  func animationControllerForPresentController(vc: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    var transition = BookOpeningTransition()
    transition.isPush = true
    transition.interactionController = interactionController
    self.transition = transition
    return transition
  }
  
  func animationControllerForDismissController(vc: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    var transition = BookOpeningTransition()
    transition.isPush = false
    transition.interactionController = interactionController
    self.transition = transition
    return transition
  }
}
