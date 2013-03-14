package com.sciprog.asynchrony {

    public class MethodInvoker extends AsyncMethodToken {
        protected var methods:Array;

        public function MethodInvoker(methods:Array) {
            super();
            this.methods = [];
            addMethods(methods);
        }

        private function addMethods(items:Array):void {
            var item:Object;
            for each (item in items) {
                if (item is Function || item is CallableMethod) {
                    methods.push(item);
                } else {
                    if (item is Array) {
                        addMethods(item as Array);
                    };
                };
            };
        }

        protected function invokeMethod(method:Object):* {
            if (method is CallableMethod) {
                return method.call();
            };

            if (method is Function) {
                return method();
            };
        }
    }
}
