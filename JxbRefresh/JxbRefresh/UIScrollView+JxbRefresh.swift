
import Foundation
import UIKit

// Corrected afterTime function
func afterTime(delay: Double) -> DispatchTime {
    return DispatchTime.now() + delay
}

// Constants
private let offset_heaer_y: CGFloat = 54.0
private let offset_footer_y: CGFloat = 54.0
private let offset_morepull_y: CGFloat = 20.0
private let offset_morenext_y: CGFloat = 40.0
private let JxbContentOffset = "contentOffset"
private let JxbPanstate = "panGestureRecognizer.state"

extension UIScrollView {
    
    // Public function to add pull refresh
    public func addPullRefresh(closure: @escaping JxbRefreshClosure) {
        self.layoutIfNeeded()
        self.jxbHeader = JxbRefreshHeader(frame: CGRect(x: 0, y: -offset_heaer_y, width: self.frame.width, height: offset_heaer_y))
        self.jxbHeader?.backgroundColor = self.backgroundColor
        self.jxbHeader!.jxbClosure = closure
        self.addSubview(self.jxbHeader!)
        self.p_addObsever()
    }
    
    // Public function to add GIF pull refresh
    public func addGifPullRefresh(idleImages: [UIImage], refreshImages: [UIImage], closure: @escaping JxbRefreshClosure) {
        self.layoutIfNeeded()
        self.jxbGifHeader = JxbRefreshGifHeader(frame: CGRect(x: 0, y: -offset_heaer_y, width: self.frame.width, height: offset_heaer_y))
        self.jxbGifHeader!.backgroundColor = self.backgroundColor
        self.jxbGifHeader!.jxbClosure = closure
        self.jxbGifHeader!.images_idle = idleImages
        self.jxbGifHeader!.images_refresh = refreshImages
        self.addSubview(self.jxbGifHeader!)
        self.p_addObsever()
    }
    
    // Trigger to pull refresh
    public func triggerPullToRefresh() {
        guard let baseHeader = self.p_getCurrentHeader() else { return }
        baseHeader.state = .willRefresh
        self.p_adjustRefresh(baseHeader)
    }
    
    // Public function to add footer refresh
    public func addFooterRefresh(closure: @escaping JxbRefreshClosure) {
        self.layoutIfNeeded()
        self.footerEnable = true
        self.jxbFooter = JxbNextRefreshFooter(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: offset_footer_y))
        self.jxbFooter?.backgroundColor = self.backgroundColor
        self.jxbFooter!.jxbClosure = closure
        self.p_addObsever()
    }
    
    // Finish pull refresh
    public func stopPullRefresh() {
        DispatchQueue.main.async { [weak self, weak baseHeader] in
            if baseHeader?.state == .refreshing {
                baseHeader?.state = .none
                baseHeader?.stopRefresh()
            }
        }
    }
    
    // Overriding willMoveToSuperview
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        // Other implementation
    }
    
    // Additional methods, enums, etc.
}

