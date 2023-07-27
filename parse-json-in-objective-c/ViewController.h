#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    CAShapeLayer *backgroundCircle;
    CAShapeLayer *progressCircle;
    float progress; // Variable to keep track of the current progress
}

@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UIButton *minusButton;

@end
