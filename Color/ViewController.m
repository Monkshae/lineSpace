//
//  ViewController.m
//  Color
//
//  Created by licong on 2017/8/22.
//  Copyright © 2017年 Richard. All rights reserved.
//

#import "ViewController.h"
#import "Father.h"
#import "NSAttributedString+Size.h"
@interface ViewController (){
    dispatch_source_t _processingQueueSource;
    dispatch_queue_t _queue;
}
@property (nonatomic, strong) CALayer *colorLayer;
@property (nonatomic, assign) BOOL running;
@property (weak, nonatomic) IBOutlet UILabel *attributedWithlineSpaceLabel;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //计算文字width 与模式的关系
    
    NSLog(@"textLabel.pointSize = %2f",self.textLabel.font.pointSize);
    NSLog(@"textLabel.lineHeight = %2f",self.textLabel.font.lineHeight);
    NSLog(@"textLabel.labelHeight = %2f",self.textLabel.bounds.size.height);


//    NSLog(@"attributedWithlineSpaceLabel.pointSize = %2f",self.attributedWithlineSpaceLabel.font.pointSize);
//    NSLog(@"attributedWithlineSpaceLabel.lineHeight = %2f",self.attributedWithlineSpaceLabel.font.lineHeight);
//    NSLog(@"attributedWithlineSpaceLabel.labelHeight = %2f",self.attributedWithlineSpaceLabel.bounds.size.height);


   
//    NSLog(@"mutipleAtributeLable.numberOfLine = %2ld",(long)self.mutipleAtributeLable.numberOfLines);

    
    //当单行的时候算出来的高度和font.lineHeight的高度是一样的
//    NSString * text = @"hello world!";
    UIFont *font = [UIFont systemFontOfSize:24];
//    CGFloat resultHeight = [text boundingRectWithSize:CGSizeMake(100, NSUIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.height;
//    NSLog(@"resultHeight = %f",resultHeight);
//    NSLog(@"font.lineHeight = %f",font.lineHeight);
//    NSLog(@"diff = %f",resultHeight - font.lineHeight);

//    NSString * text1 = @"hello world!";//@"hello world!";
//    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 150, 0)];
//    label1.text = text1;
//    label1.font = font;
//    label1.numberOfLines = 0;
//    label1.backgroundColor = UIColor.redColor;
//    [self.view addSubview:label1];
//    [label1 sizeToFit];
//    NSLog(@"label1.heihgt = %2f",label1.bounds.size.height);
//    NSLog(@"label1.lineHeight = %2f",label1.font.lineHeight);
//
//
//    NSString * text2 = @"hello world!hello world!hello world!";//@"hello world!";
//    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(200, 100, 150, 0)];
//    label2.text = text2;
//    label2.font = font;
//    label2.numberOfLines = 0;
//    label2.backgroundColor = UIColor.redColor;
//    [self.view addSubview:label2];
//    [label2 sizeToFit];
//    NSLog(@"label2.heihgt = %2f",label2.bounds.size.height);
//    NSLog(@"label2.lineHeight = %2f",label2.font.lineHeight);
//
    NSString * text3 = @"ccc小书包！"; //@"hello world!";
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(50, 250, 150, 0)];
    NSAttributedString * attriString3 = [NSAttributedString attributedStringWithString:text3 font:font color:UIColor.blackColor maxWidth:150 lineSpacing:5];
    label3.attributedText = attriString3;
    label3.numberOfLines = 0;
    label3.backgroundColor = UIColor.redColor;
    [self.view addSubview:label3];
    [label3 sizeToFit];
    NSLog(@"label3.heihgt = %2f",label3.bounds.size.height);
    NSLog(@"label3.lineHeight = %2f",label3.font.lineHeight);


    NSString * text4 = @"hello world!hello world!hello world!";//@"hello world!";
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(200, 250, 150, 0)];
    NSAttributedString * attriString4 = [NSAttributedString attributedStringWithString:text4 font:font color:UIColor.blackColor maxWidth:150 lineSpacing:5];
    label4.attributedText = attriString4;
    label4.adjustsFontSizeToFitWidth = YES;
    label4.minimumScaleFactor = 0.5;
    label4.numberOfLines = 0;
    label4.backgroundColor = UIColor.redColor;
    [self.view addSubview:label4];
    [label4 sizeToFit];

    NSLog(@"label4.pointSize = %2f",label4.font.pointSize);
    NSLog(@"label4.lineHeight = %2f",label4.font.lineHeight);
    NSLog(@"label4.heihgt1 = %2f",label4.bounds.size.height);
    //文本有三行
    NSLog(@"label4.height2 = %2f",label4.font.lineHeight * 3 + 5 * 2);
    
    
//    NSAttributedString * attriString = [NSAttributedString attributedStringWithString:text font:[UIFont systemFontOfSize:14] color:UIColor.whiteColor lineSpacing:5];
    
    
    
//    UIView * view = [[UIView alloc]init];
//    view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
//
//    self.colorLayer = [CALayer layer];
//    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
//    self.colorLayer.position = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
//    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
//    [self.view.layer addSublayer:self.colorLayer];
//
    
//    self.running = YES;
//    //1.
//    // 指定DISPATCH_SOURCE_TYPE_DATA_ADD，做成Dispatch Source(分派源)。设定Main Dispatch Queue 为追加处理的Dispatch Queue
//    _processingQueueSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0,
//                                                    dispatch_get_main_queue());
//    __block NSUInteger totalComplete = 0;
//    dispatch_source_set_event_handler(_processingQueueSource, ^{
//        //当处理事件被最终执行时，计算后的数据可以通过dispatch_source_get_data来获取。这个数据的值在每次响应事件执行后会被重置，所以totalComplete的值是最终累积的值。
//        NSUInteger value = dispatch_source_get_data(_processingQueueSource);
//        totalComplete += value;
//        NSLog(@"进度：%@", @((CGFloat)totalComplete/100));
//        NSLog(@"🔵线程号：%@", [NSThread currentThread]);
//    });
//
//    _queue = dispatch_queue_create("com.ioschengxuyuan.queue1", 0);
//
//        for (NSUInteger index = 0; index < 100; index++) {
//            NSLog(@"😆index：%ld", index);
//            dispatch_async(_queue, ^{
//                if (!self.running) {
//                    return;
//                }
//                NSLog(@"♻️index：%ld", index);
//                usleep(100000);//0.2秒
//            });
//        }

    
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    for (int i = 0; i < 100; i++)
//    {
//        int a =  dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        NSLog(@"a = %ld",a);
//        dispatch_group_async(group, queue, ^{
//            NSLog(@"%i",i);
//            sleep(2);
//            dispatch_semaphore_signal(semaphore);
//        });
//    }
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    dispatch_release(group);
//    dispatch_release(semaphore);
    

//    __block BOOL isok = NO;
//
//    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
//    Engine *engine = [[Engine alloc] init];
//    [engine queryCompletion:^(BOOL isOpen) {
//        isok = isOpen;
//        dispatch_semaphore_signal(sema);
//    } onError:^(int errorCode, NSString *errorMessage) {
//        isok = NO;
//        dispatch_semaphore_signal(sema);
//    }];
//
//    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//    dispatch_release(sema);


    
    
//    Son * s = [[Son alloc]init];
}

- (void)changeStatus:(BOOL)shouldPause {
    if (shouldPause) {
        [self pause];
    } else {
        [self resume];
    }
}

- (void)resume {
    if (self.running) {
        return;
    }
    NSLog(@"✅恢复Dispatch Source(分派源)以及_queue");
    self.running = YES;
//    dispatch_resume(_processingQueueSource);
    if (_queue) {
        dispatch_resume(_queue);
    }
}

- (void)pause {
    if (!self.running) {
        return;
    }
    NSLog(@"🚫暂停Dispatch Source(分派源)以及_queue");
    self.running = NO;
//    dispatch_suspend(_processingQueueSource);
    dispatch_suspend(_queue);
}


//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //get the touch point
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    //check if we've tapped the moving layer
//    if ([self.colorLayer.presentationLayer hitTest:point]) {
//        //randomize the layer background color
//        CGFloat red = arc4random() / (CGFloat)INT_MAX;
//        CGFloat green = arc4random() / (CGFloat)INT_MAX;
//        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
//        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
//    } else {
//        //otherwise (slowly) move the layer to new position
//        [CATransaction begin];
//        [CATransaction setAnimationDuration:4.0];
//        self.colorLayer.position = point;
//        [CATransaction commit];
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self changeStatus:self.running];

    // Dispose of any resources that can be recreated.
}


@end
