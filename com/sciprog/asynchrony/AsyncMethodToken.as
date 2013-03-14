package com.sciprog.asynchrony {
    import flash.utils.*;
    import flash.events.*;

    public class AsyncMethodToken extends EventDispatcher implements Asynchronous {
        private var _tokens:uint;

        public function AsyncMethodToken() {
            super();
            tokens = 0;
        }

        public function done(event:Event=null):void {
            if (event) {
                event.target.removeEventListener(event.type, arguments.callee);
            };

            if (isAvailable) {
                return;
            };

            tokens--;
        }

        private function set tokens(value:uint):void {
            var oldValue:uint = _tokens;
            _tokens = value;
            if (tokens == 0) {
                dispatchEvent(new AsyncEvent(AsyncEvent.AVAILABLE));
            } else {
                if (tokens == 1 && oldValue == 0) {
                    dispatchEvent(new AsyncEvent(AsyncEvent.UNAVAILABLE));
                };
            };
        }

        public function wait():void{
            tokens++;
        }

        public function get isAvailable():Boolean{
            return tokens == 0;
        }

        public function waitForAsync(async:Asynchronous):void{
            waitForEvent(async, AsyncEvent.AVAILABLE);
        }

        private function get tokens():uint{
            return _tokens;
        }

        public function waitFor(time:uint):void{
            if (time == 0) {
                return;
            };
            wait();
            setTimeout(done, time);
        }

        public function waitForEvent(dispatcher:IEventDispatcher, type:String):void{
            wait();
            dispatcher.addEventListener(type, done);
        }
    }
}
