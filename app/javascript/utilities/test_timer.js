$(document).on('turbolinks:load', function() {
    let $timer = $('.timer')
    if ($timer.length) {
        var seconds = $timer.data('timer')
        setInterval(function(){
            seconds--
            var date = new Date(0, 0, 0)
            date.setSeconds(seconds)
            var h = date.getHours()
            var m = date.getMinutes()
            var s = date.getSeconds()
            $timer.text(`${h}:${m}:${s}`)
            if (seconds <= 0) {
                $('form').submit()
            }
        }, 1000)
    }
})
