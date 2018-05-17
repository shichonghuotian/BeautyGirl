//
//  DoubanModel.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "DoubanModel.h"
#import "TFHpple.h"

@implementation DoubanModel

-(RACSignal *)getData {
    
    return [self getGirl:self.cID page:self.page];
}

-(NSArray*)parseData:(NSData*)data {
    
    TFHpple * xpathParser = [[TFHpple alloc] initWithHTMLData:data];
//
//    <div class="img_single"> <a href="https://www.dbmeinv.com:443/dbgroup/1678847" class="link" target="_topic_detail"> <img class="height_min" title="胸没肚子大.." alt="胸没肚子大.." onerror="img_error(this);" src="https://wx4.sinaimg.cn/bmiddle/0060lm7Tgy1fql83wu938j30dw0oo0xq.jpg" /> </a> </div>
//    NSArray *dataArr = [doc searchWithXPathQuery:@"div[class=thumbnail]>div[class=img_single]>a>img"];
    
    NSArray *itemArray = [xpathParser searchWithXPathQuery:@"//div[@class = 'thumbnail']//div[@class = 'img_single']//a//img"];

    NSMutableArray<DoubanGirlBody*> *array = [NSMutableArray new];
    
    for (TFHppleElement *ele in itemArray) {
        NSString *src = [ele objectForKey:@"src"];
        NSString *title = [ele objectForKey:@"title"];

        DoubanGirlBody *body = [DoubanGirlBody new];
        
        body.url = src;
        body.title = title;
        

        [array addObject:body];
        
    }
   
    return array;
}


-(RACSignal *)getGirl:(NSInteger)cid page:(NSInteger)page {
    @weakify(self)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        
        [ApiManager getDoubanGirlWithID:cid page:page success:^(id  _Nullable responseObject) {
           
//            NSLog(@"response = %@",responseObject);
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^{
              [subscriber sendError:[NSError new]];
        }];
        
        return nil;
    }];
    
    return   [[[signal filter:^BOOL(id  _Nullable responseObject) {
        
        return YES;
    }] map:^id (NSData *data) {
         @strongify(self)
        return [self parseData:data];
    }] deliverOn:[RACScheduler mainThreadScheduler]];
              
    
    
}
@end
