package com.sciprog.asynchrony {
    import flash.events.*;

    public class MethodSequence extends MethodInvoker {
        private var currentMethodIndex:uint;

        public function MethodSequence(... _args) {
            super(_args);
        }

        private function executeNextMethod(event:Event=null):void {
            if (event){
                event.target.removeEventListener(event.type, arguments.callee);
            };

            var async:Asynchronous = invokeMethod(methods[currentMethodIndex]);
            currentMethodIndex++;
            if (currentMethodIndex >= methods.length){
                done();
                return;
            };

            if (async && !async.isAvailable) {
                async.addEventListener(AsyncEvent.AVAILABLE, executeNextMethod);
            } else {
                executeNextMethod();
            };
        }

        public function execute():MethodSequence {
            wait();
            currentMethodIndex = 0;
            executeNextMethod();
            return this;
        }
    }
}
