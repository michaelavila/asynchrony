package com.sciprog.asynchrony {
    import flash.events.IEventDispatcher;

    public interface Asynchronous extends IEventDispatcher {
        function get isAvailable():Boolean;
    }
}
