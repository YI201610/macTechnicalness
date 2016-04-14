/*!
 * @abstract    クラスのプロパティから辞書を作成する - ARC対応版
 */
//辞書のキーとなる、プロパティ名称(NSString)群の格納領域を初期化する。
NSMutableArray *propertyArray = [NSMutableArray new];

unsigned int count = 0; //プロパティ数を格納する領域
            
//オブジェクトからプロパティの一覧を求める
objc_property_t *propertyList = class_copyPropertyList([obj class], &count);
debugout(@"property count: %d", count); //プロパティ数
            
//プロパティ数だけ名称を調べ、キー候補をを作成する。
for(int i = 0; i < count; i++){
	objc_property_t property_ = *(propertyList + i);
	NSString *propertyName = [NSString stringWithUTF8String:property_getName(property_)];
	if(propertyName){
		//キー候補領域に、プロパティ名称を追加
        [propertyArray addObject:propertyName];
	}
}

if(propertyList){
	//class_copyPropertyListメソッドの制約のため、free関数で、objc_property_tオブジェクトを解放する。
    free(propertyList);
    propertyList = NULL;
}

/*  dictionaryWithValuesForKeysの、header file commentより...
 *
 *  Given an array of keys, return a dictionary containing the keyed attribute values, 
 *  to-one-related objects, and/or collections of to-many-related objects. 
 *  Entries for which -valueForKey: returns nil have NSNull as their value in the returned dictionary.
 */
//オブジェクトから辞書 result を作成する。
//※nilがセットされているプロパティの実値は、NSNullオブジェクトで置換されるので注意すること。
NSDictionary *result = [obj dictionaryWithValuesForKeys: propertyArray];

