//
//  FMDBConfig.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/21.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#ifndef FMDBConfig_h
#define FMDBConfig_h

//FMDB
#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }

/**
 *  消息列表dataPath
 */
#define DATABASE_MYMSGLIST     [NSString stringWithFormat:@"%@/Documents/myMsgList.db", NSHomeDirectory()]

/**
 *  搜索数据库
 */
#define DATABASE_SEARCH_PATH [NSString stringWithFormat:@"%@/Documents/MDSearch.db", NSHomeDirectory()]

/**
 *  默认数据库
 */
#define DATABASE_DEFAULT_PATH [NSString stringWithFormat:@"%@/Documents/MDDefault.db", NSHomeDirectory()]


#endif /* FMDBConfig_h */
