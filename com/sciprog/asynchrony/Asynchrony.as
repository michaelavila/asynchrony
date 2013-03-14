package com.sciprog.asynchrony {
    import flash.events.IEventDispatcher;

    public class Asynchrony {

        public function Asynchrony() {
            super();
        }

        public static function waitForEvent(dispatcher:IEventDispatcher, type:String):AsyncMethodToken {
            var token:AsyncMethodToken = new AsyncMethodToken();
            token.waitForEvent(dispatcher, type);
            return token;
        }
    }
}
