#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    progress = 0.0;

    int radius = 100;
    CGPoint centerPoint = self.view.center; // set center point as view's center

    // Background circle
    backgroundCircle = [CAShapeLayer layer];
    backgroundCircle.path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:-M_PI_2 endAngle:2*M_PI-M_PI_2 clockwise:YES].CGPath;
    backgroundCircle.fillColor = [UIColor clearColor].CGColor;
    backgroundCircle.strokeColor = [UIColor grayColor].CGColor; // set background circle color to white
    backgroundCircle.lineWidth = 10;
    backgroundCircle.lineCap = kCALineCapRound; // Make the ends of the line round
    [self.view.layer addSublayer:backgroundCircle];

    // Progress circle
    progressCircle = [CAShapeLayer layer];
    progressCircle.path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:-M_PI_2 endAngle:2*M_PI-M_PI_2 clockwise:YES].CGPath;
    progressCircle.fillColor = [UIColor clearColor].CGColor;
    progressCircle.strokeColor = [UIColor whiteColor].CGColor;
    progressCircle.lineWidth = 10;
    progressCircle.lineCap = kCALineCapRound; // Make the ends of the line round
    progressCircle.strokeEnd = 0;
    [self.view.layer addSublayer:progressCircle];

    // Configure the buttons
    int buttonWidth = 80;
    int buttonHeight = 40;
    self.minusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.minusButton.frame = CGRectMake(centerPoint.x - buttonWidth - 10, centerPoint.y + radius + 10, buttonWidth, buttonHeight);
    [self.minusButton setTitle:@"Minus" forState:UIControlStateNormal];
    [self.minusButton addTarget:self action:@selector(decreaseProgress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.minusButton];
    
    self.plusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.plusButton.frame = CGRectMake(centerPoint.x + 10, centerPoint.y + radius + 10, buttonWidth, buttonHeight);
    [self.plusButton setTitle:@"Plus" forState:UIControlStateNormal];
    [self.plusButton addTarget:self action:@selector(increaseProgress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.plusButton];
}

// Method to increase the progress
- (void)increaseProgress {
    progress += 0.1;
    if (progress > 1.0) {
        progress = 1.0;
    }
    [self updateProgress];
}

// Method to decrease the progress
- (void)decreaseProgress {
    progress -= 0.1;
    if (progress < 0.0) {
        progress = 0.0;
    }
    [self updateProgress];
}

// Method to update the progress on the circle
- (void)updateProgress {
    progressCircle.strokeEnd = progress;
}

@end
