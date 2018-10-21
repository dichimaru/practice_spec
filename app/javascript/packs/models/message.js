export default class Message {
    static alert (messages) {
        this.show(messages, 'is-alert')
    }
    static notice (messages) {
        this.show(messages, 'is-notice')
    }
    static show (messages, cssClassName) {
        if (!$.isArray(messages)) {
            messages = [messages]
        }
        $('#flash-messages-ul li').remove()
        messages.forEach(function (message) {
            $('#flash-messages-ul').append($('<li />').text(message))
        })
        $('.js-messagejs').show().removeClass('is-hidden')
            .removeClass('is-alert')
            .removeClass('is-notice')
            .addClass(cssClassName)
    }
    static hide () {
        $('.js-messagejs').addClass('is-hidden')
    }
    static bind () {
        setTimeout(function () {
            $('.flash').fadeOut()
        }, 5000)
        $(document).on('click', '.js-close-parent__trigger', function () {
            $(this).parents('.js-close-parent').addClass('is-hidden').hide()
        })
    }
}
