package com.sciprog.asynchrony {
    import flash.events.Event;

    public class AsyncEvent extends Event {
        public static const UNAVAILABLE:String = "org.proas.async.AsyncEvent#unavailable";
        public static const AVAILABLE:String = "org.proas.async.AsyncEvent#available";

        public function AsyncEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=true) {
            super(type, bubbles, cancelable);
        }
    }
}
