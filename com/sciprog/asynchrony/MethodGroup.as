package com.sciprog.asynchrony {

    public class MethodGroup extends MethodInvoker {

        public function MethodGroup(... _args) {
            super(_args);
        }

        public function execute():MethodGroup {
            var method:Object;
            var async:Asynchronous;
            for each (method in methods) {
                async = invokeMethod(method) as Asynchronous;
                if (async) {
                    waitForAsync(async);
                };
            };
            return this;
        }
    }
}
