//
//  ViewController.m
//  Effective_OC
//
//  Created by 范兴政 on 15/9/7.
//  Copyright (c) 2015年 fanxingzheng. All rights reserved.
//

#import "ViewController.h"
#import "Effective_OC_01.h"
#import "Effective_OC_runtime.h"
#import "EOCExchangeImplementation.h"
#import <objc/runtime.h>
#import "NSString+Swizzle.h"//runtime
//api
#import "EOCRectangle.h"
#import "EOCSquare.h"
#import "EOCPointOfInterest.h"
#import "EOC_3_API_Person.h"
#import "EOCErrorTest.h"
//protocol category
#import "EOCDataModel.h"
#import "EOC_3_API_Person+Work.h"
#import "EOCClass.h"
#import "EOCDatabaseManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createView];
    
    //[self testapi];
    [self test28];
}

- (void)createView {
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setBackgroundColor:[UIColor blueColor]];
    objc_setAssociatedObject(button, @"dictionary", @{@"value":@"fanxingzheng"}, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [button setFrame:CGRectMake(30, 30, 100, 44)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(headButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)headButtonPressed:(UIButton *)sender
{
    NSLog(@"%@",objc_getAssociatedObject(sender, @"dictionary"));
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"button" message:[objc_getAssociatedObject(sender, @"dictionary") objectForKey:@"value"] delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"OK", nil];
    void (^block)(NSInteger)=^(NSInteger buttonIndex){
        if (buttonIndex==0) {
            NSLog(@"cancel");
        }
        else if (buttonIndex==1){
            NSLog(@"OK");
        }
    };
    objc_setAssociatedObject(alert, @"block", block, OBJC_ASSOCIATION_COPY);
    [alert show];
}

- (void)eoctest {
    [[Effective_OC_01 new] testmemberkind];
    [[Effective_OC_01 new] performSelector:@selector(testmember) withObject:nil];
    NSLog(@"%@",NSStringFromClass([NSArray class]));
    
    NSString *str=[NSString string];
    [str performSelector:@selector(count)];
    [str performSelector:@selector(objectAtIndex:)];
    [str performSelector:@selector(makeObjectsPerformSelector:withObject:)];
    
}

- (void)testapi {
    EOCRectangle *rectangle=[[EOCRectangle alloc] init];
    NSLog(@"width=%f, height=%f",rectangle.width,rectangle.height);
    EOCSquare *square=[[EOCSquare alloc] initWithDimension:6.0f];
    NSLog(@"width=%f, height=%f",square.width,square.height);
    NSLog(@"%@",rectangle);
    
    int a[5]={1,2,3,4,5};
    int *p=(int *)(&a+1);
    printf("%d %d\n",*(a+1),*(p-1));
    
    
    NSArray *array=@[@"Effective Objective_C 2.0",@(123),@YES];
    NSLog(@"array=%@",array);
    
    //readonly
    EOC_3_API_Person *fanxingzheng=[[EOC_3_API_Person alloc] initWithFirstName:@"xingzheng" lastName:@"fan"];
    EOC_3_API_Person *fanxingzhen=[[EOC_3_API_Person alloc] initWithFirstName:@"xingzhen" lastName:@"fan"];
    EOC_3_API_Person *fanxing=[[EOC_3_API_Person alloc] initWithFirstName:@"xing" lastName:@"fan"];
    [fanxingzheng addFriend:fanxingzhen];
    [fanxingzheng addFriend:fanxing];
    NSLog(@"fanxingzheng=%@",fanxingzheng);
    
    EOC_3_API_Person *newfanxingzheng=[fanxingzheng deepCopy];
    NSLog(@"newfanxingzheng=%@",newfanxingzheng);
    
    //*(&fanxing+24)=@"f";
    NSString *str=*(&fanxing+16);
    str=@"f";
    NSLog(@"fanxingzheng=%@",fanxingzheng);
    NSLog(@"newfanxingzheng=%@",newfanxingzheng);
}

- (void)testError {
    NSError *error=nil;
    BOOL ret=[[EOCErrorTest new] doSomething:&error];
    NSLog(@"ret=%d",ret);
    if (error) {
        NSLog(@"error=%@",error);
    }
}

- (void)testEntrustModel {
    [[EOCDataModel new] testEntrustModel];
}

- (void)testCategory {
    [[EOC_3_API_Person new] performDaysWork];
}

- (void)test28 {
    EOCDatabaseManager *manager=[EOCDatabaseManager sharedInstance];
    id <EOCDatabaseConnectionDelegate> mysqlConnnection=[manager connectionWithIdentifier:@"mysql"];
    [mysqlConnnection connect];
    [mysqlConnnection disconnect];
    
    id <EOCDatabaseConnectionDelegate> oracleConnection=[manager connectionWithIdentifier:@"oracle"];
    [oracleConnection isConnected];
    NSLog(@"result:%@",[oracleConnection performQuery:@"zheng"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
