package com.sciprog.asynchrony {

    public class CallableMethod {
        private var method:Function;
        private var args:Array;

        public function CallableMethod(method:Function, args:Array=null) {
            super();
            this.method = method;
            this.args = args;
        }

        public function call():* {
            return method.apply(null, args);
        }
    }
}
