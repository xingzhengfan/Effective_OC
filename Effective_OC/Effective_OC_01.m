//
//  Effective_OC_01.m
//  studentApp
//
//  Created by goodplay_02 on 15/7/26.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Effective_OC_01.h"
#import "EOCBrain.h"
#import "EOCPerson.h"
#import "EOCSmithPerson.h"
#import "EOCEmployee.h"

typedef NS_ENUM(NSUInteger, AWSType){
    AWSTypeNone,
    AWSTypeA,
    AWSTypeB,
    AWSTypeC,
    AWSTypeURL,
};

const NSArray *__AWSType;

#define cAWSTypeTranslate (__AWSType==nil?__AWSType=[[NSArray alloc] initWithObjects:@"AWSTypeNone", @"AWSTypeA", @"AWSTypeB", @"AWSTypeC", @"AWSTypeURL", nil]:__AWSType)

#define translateToString(type) ([cAWSTypeTranslate objectAtIndex:type])
#define translateToEnum(string) ([cAWSTypeTranslate indexOfObject:string])

@implementation Effective_OC_01

- (void)test
{
    NSString *b=nil;
    NSArray *arr=[NSArray arrayWithObjects:@"a",b,@"b", nil];
    NSLog(@"arr=%@",arr);
    NSString *xingzheng=nil;
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"fan",@"LastName",xingzheng,@"FirstName",@22,@"age", nil];
    NSLog(@"dict=%@",dict);
    
    //NSMutableArray *mutableArr=[NSMutableArray arrayWithArray:@[@"2",@"a",@"a"]];
    NSMutableArray *mutableArr=[@[@"2",@"a",@"a"] mutableCopy];
    mutableArr[2]=@"3";
    [mutableArr replaceObjectAtIndex:0 withObject:@1];
    NSLog(@"mutableArr=%@",mutableArr);
    
    //NSMutableDictionary *mutableDict=[NSMutableDictionary dictionaryWithDictionary:@{@"LastName":@"fan",@"FirstName":@"xingzheng",@"age":@22}];
    NSMutableDictionary *mutableDict=[@{@"LastName":@"fan",@"FirstName":@"xingzheng",@"age":@22} mutableCopy];
    [mutableDict setObject:@21 forKey:@"age"];
    NSLog(@"mutableDict=%@",mutableDict);
    mutableDict[@"age"]=@22;
    NSLog(@"mutableDict=%@",mutableDict);
    
    typedef enum{
        ConnectionStateDisconnected,
        ConnectionStateConnecting,
        ConnectionStateConnected,
    }ConnectionState;
    //typedef enum ConnectionState ConnectionState;
    
    ConnectionState state=ConnectionStateConnected;
    NSLog(@"connectionState=%d",state);
    
    enum EOCConnectionState : NSInteger;
    typedef enum : NSInteger{
        EOCConnectionStateDisconnected=1,
        EOCConncetionStateConnecting,
        EOCConnectionStateConnected,
    }EOCConnectionState;
    
    EOCConnectionState eocState=EOCConncetionStateConnecting;
    NSLog(@"state=%ld",eocState);
    
    typedef enum{
        EOCAutoresizingNone                   =  0,
        EOCAutoresizingFlexibleLeftMargin     =  1<<0,
        EOCAutoresizingFlexibleWidth          =  2<<0,
        EOCAutoresizingFlexibleRightMargin    =  3<<0,
        EOCAutoresizingFlexibleTopMargin      =  4<<0,
        EOCAutoresizingFlexibleHeight         =  5<<0,
        EOCAutoresizingFlexibleBottomMargin   =  6<<0,
    }EOCAutoresizing;
    
    EOCAutoresizing autoresizing=EOCAutoresizingFlexibleWidth|EOCAutoresizingFlexibleBottomMargin;
    if (autoresizing&EOCAutoresizingFlexibleBottomMargin) {
        NSLog(@"EOCAutoresizingFlexibleBottomMargin is set");
    }
    
    typedef NS_ENUM(NSUInteger, EOCNetConnectionState){
        EOCNetConnectionStateDisconnected,
        EOCNetConnectionStateConnecting,
        EOCNetConnectionStateConnected,
    };
    
    EOCNetConnectionState netState=EOCNetConnectionStateConnected;
    NSLog(@"netState=%ld",netState);
    
    typedef NS_OPTIONS(NSUInteger, EOCDirection){
        EOCDirectionUp    =  1<<0,
        EOCDirectionDown  =  2<<0,
        EOCDirectionLeft  =  3<<0,
        EOCDirectionRight =  4<<0,
    };
    
    EOCDirection direction=EOCDirectionDown|EOCDirectionLeft;
    if (direction&EOCDirectionLeft) {
        NSLog(@"EOCDirectionLeft is set");
    }
    
    typedef enum EOCNetworkState : NSUInteger EOCNetworkState;
    enum EOCNetworkState : NSUInteger{
        EOCNetworkStateDisconnected,
        EOCNetworkStateConnecting,
        EOCNetworkStateConnected,
    };
    
    EOCNetworkState networkState=EOCNetworkStateDisconnected;
    NSLog(@"networkState=%ld",networkState);
    
    switch (networkState) {
        case EOCNetworkStateDisconnected:
            NSLog(@"Disconnected");
            break;
        case EOCNetworkStateConnecting:
            NSLog(@"Connecting");
            break;
        case EOCNetworkStateConnected:
            NSLog(@"Connected");
            break;
            //default:break; //如果没有default分支 则枚举加入新的状态值时会提示此分支
    }
    
    NSLog(@"%@",[_brain dispatch]);
    NSLog(@"%@",[self.brain dispatch]);
    EOCBrain *brain1=[EOCBrain new];
    EOCBrain *brain2=[EOCBrain new];
    brain1.brain=@"fan";
    brain2.brain=@"fan";
    NSLog(@"%ld %ld",[brain1 hash],[brain2 hash]);
    NSLog(@"%@",[brain1 isEqualToBrain:brain2]?@"yes":@"no");
    
    EOCPerson *person1=[EOCPerson new];
    person1.firstName=@"xingzheng";
    person1.lastName=@"fan";
    person1.age=22;
    EOCSmithPerson *person2=[EOCSmithPerson new];
    person2.firstName=@"xingzheng";
    person2.lastName=@"fan";
    person2.age=22;
    NSLog(@"%@",[person1 isEqual:person2]?@"yes":@"no");
}

- (EOCBrain *)brain
{
    if (!_brain) {
        _brain=[EOCBrain new];
    }
    return _brain;
}

#pragma mark -testHash
- (void)testHash
{
    NSMutableSet *set=[NSMutableSet new];
    
    NSMutableArray *arrA=[@[@1,@2] mutableCopy];
    [set addObject:arrA];
    NSLog(@"set=%@",set);
    
    NSMutableArray *arrB=[@[@1,@2] mutableCopy];
    [set addObject:arrB];
    NSLog(@"set=%@",set);
    
    NSMutableArray *arrC=[@[@1] mutableCopy];
    [set addObject:arrC];
    NSLog(@"set=%@",set);
    
    [arrC addObject:@2];
    NSLog(@"set=%@",set);
    
    NSSet *setB=[set copy];
    NSLog(@"setB=%@",setB);
}

#pragma mark -testFactory
- (void)testFactory
{
    EOCEmployee *employee=[EOCEmployee employeeWithType:EOCEmployeeTypeFinance];
    [employee doADaysWork];
}

#pragma mark -most
- (void)most:(int)count
{
    int a[count];
    int b[count];
    int c[count];
    
    for (int i=0; i<count; ++i) {
        a[i]=20-(rand()%40);
        b[i]=-30;
        c[i]=-30;
    }
    
    for (int i=0; i<count; ++i) {
        printf("%d  ",a[i]);
    }
    
    int ib=0;
    for (int i=0; i<count; ++i) {
        //第i个数值
        int k=a[i];
        BOOL has=NO;
        //遍历b[]中是否有k
        for (int j=0; j<count; ++j) {
            if (b[j]==k) {
                has=YES;
            }
        }
        if (!has) {
            //没有就把k放入到b[]中 并计算出k在a[]中出现的次数
            b[ib++]=k;//放入
            //计算k在a[]中出现的次数
            int kc=0;//次数初始化
            for (int j=0; j<count; ++j) {
                if (a[j]==k) {
                    kc++;
                }
            }
            //将k出现的次数放入到c[]中
            c[ib-1]=kc;
        }
        else
        {
            //有就跳过这个数值k
            continue;
        }
    }
    
    printf("\n\n\n");
    for (int i=0; i<count; ++i) {
        if (b[i]==-30) {
            break;
        }
        //printf("%d c=%d\n",b[i],c[i]);
    }
    
    int ic=0;
    int m=0;
    for (int i=0; i<count; ++i) {
        if (c[i]>m) {
            ic=i;
            m=c[i];
        }
    }
    
    printf("most is %d appear %d time\n\n",b[ic],c[ic]);
}

#pragma mark -testEnum
- (void)testEnum {
    NSLog(@"%@",translateToString(AWSTypeB));
    NSLog(@"%ld",translateToEnum(@"AWSTypeURL"));
}

#pragma mark -member kind
- (void)testmemberkind {
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    NSLog(@"NSMutableDictionary isMemberOfClass:NSDictionary %d",[dict isMemberOfClass:[NSDictionary class]]);
    NSLog(@"NSMutableDictionary isMemberOfClass:NSMutableDictionary %d",[dict isMemberOfClass:[NSMutableDictionary class]]);
    NSLog(@"NSMutableDictionary isKindOfClass:NSDictionary %d",[dict isKindOfClass:[NSDictionary class]]);
    NSLog(@"NSMutableDictionary isKindOfClass:NSArray %d",[dict isKindOfClass:[NSArray class]]);
    
    NSString *string=[NSString string];
    NSLog(@"NSString isMemberOfClass : NSString %d",[string isMemberOfClass:[NSString class]]);
}

- (void)testmember {
    NSLog(@"nsobject %d",[[NSObject new] isMemberOfClass:[NSObject class]]);
    NSLog(@"nsarray %d",[[NSArray new] isMemberOfClass:[NSArray class]]);
    NSLog(@"nsmutablearray %d",[[NSMutableArray new] isMemberOfClass:[NSMutableArray class]]);
    NSLog(@"nsdictionary %d",[[NSDictionary new] isMemberOfClass:[NSDictionary class]]);
    NSLog(@"nsmutabledictionary %d",[[NSMutableDictionary new] isMemberOfClass:[NSMutableDictionary class]]);
    NSLog(@"nsstring %d",[[NSString new] isMemberOfClass:[NSString class]]);
    NSLog(@"nsmutablestring %d",[[NSMutableString new] isMemberOfClass:[NSMutableString class]]);
    NSLog(@"effective_oc_1 %d",[[Effective_OC_01 new] isMemberOfClass:[Effective_OC_01 class]]);
}

@end
