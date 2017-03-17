//https://github.com/ReactiveCocoa/ReactiveObjC/pull/27
//https://github.com/ReactiveCocoa/ReactiveObjC/pull/33

//文档：
//Block语法：https://github.com/bang590/JSPatch/wiki/JPBlock-%E6%89%A9%E5%B1%95%E4%BD%BF%E7%94%A8%E6%96%87%E6%A1%A3

require('ReactiveObjC, UITextView, NSString, RACDynamicSignal, RACSignal, RACStream');
require('JPEngine').addExtensions(['JPBlock', 'RACExtension']);


defineClass('ViewController', {

	jsPatchWithRac: function() {
            
		RACObserve(self, self, "text")
        .ignore(null)
		.subscribeNext(block("void,id", function(value){
			console.log(value)
		}))

		var weakSelf = __weak(self);

		self.textView().rac__textSignal.filter(
			block("BOOL,NSString", function(value){
				if (value != null && value.length() > 0) {
					return true
				} else {
					return false
				}
			})
		)
		.distinctUntilChanged()
		.subscribeNext(block("void,NSString", function(value){
			var strongSelf = __strong(weakSelf)
			var changeStr = x.stringByAppendingString("哈哈哈哈，JSPatch")
			strongSelf.setText(changeStr)
		}))
	},


});
